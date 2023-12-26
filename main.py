import os
import time
import asyncio
from pymongo import MongoClient
from langchain.vectorstores import MongoDBAtlasVectorSearch
from langchain.embeddings import OpenAIEmbeddings
from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
import json

## Connect to MongoDB Atlas local cluster
MONGODB_ATLAS_CLUSTER_URI = os.getenv('MONGODB_ATLAS_CLUSTER_URI')
client = MongoClient(MONGODB_ATLAS_CLUSTER_URI)
db_name = 'sample_mflix'
collection_name = 'movies'
collection = client[db_name][collection_name]

## Create a collection and insert data
print ('Creating collection movies')
client[db_name].create_collection(collection_name)

with open('sample_mflix.embedded_movies.json', 'r') as file:
    data = json.load(file)

print ('Inserting data into collection movies')
collection.insert_many(data)

## Create a vector search index
print ('Creating vector search index')
collection.create_search_index(model={"definition": {"mappings":{
  "dynamic":True,
  "fields": {
    "plot_embedding": {
      "type": "knnVector",
      "dimensions": 1536,
      "similarity": "euclidean"
    }
  }
}}, "name":'default'})

# sleep for minute
print ('Waiting for vector index on field "embedding" to be created')
time.sleep(60)

## Create a vector store
vector_store = MongoDBAtlasVectorSearch(embedding=OpenAIEmbeddings(), collection=collection, index_name='default', text_key='plot', embedding_key='plot_embedding')
print('Searching for: What movies are scary?')

## Search for similar movies
movies = vector_store.similarity_search('What movies are scary?', 3)
for movie in movies:
    print('Movie title: ' + movie.metadata['title'] )
    print('Plot: ' + movie.page_content)
    print('')

# get user input for search term
while True:
    prompt = input('Enter a search term/sentence: ')
    print ('Searching for: ' + prompt)
    movies = vector_store.similarity_search(prompt, 3)
    for movie in movies:
        print('Movie title: ' + movie.metadata['title'] )
        print('Plot: ' + movie.page_content)
        print('')







