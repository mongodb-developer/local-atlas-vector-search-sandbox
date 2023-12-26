# local-atlas-vector-search-sandbox
This repo allows users to spin a functioning movie plot search using langchain, local atlas instance and its vector search.

## Prerequistes

- `Python3` binary installed
- `pip3` package manager installed
- `atlas` cli installed : https://www.mongodb.com/docs/atlas/cli/stable/install-atlas-cli/
- Open AI API key : https://platform.openai.com/api-keys

## Setup
1. Clone the repo:
```
git clone https://github.com/mongodb-developer/local-atlas-vector-search-sandbox.git
```
2. Unzip the data file `sample_mflix.embedded_movies.json.zip` to `sample_mflix.embedded_movies.json`
2. Grant execution to the `run.sh`:
```
chmod +x run.sh
```

## Run
```
./run.sh <YOUR_OPEN_AI_KEY>
```

### Example output
```
Installing MongoDB Atlas CLI...
Setting up local MongoDB deployment...
Could not refresh access token: session expired

To login, run: atlas auth login

[Default Settings]
Deployment Name   local6236
MongoDB Version   7.0
Port              27017

Creating your cluster local6236
1/2: Starting your local environment...
2/2: Creating your deployment local6236...
Deployment created!

connection skipped
The connection string is: mongodb://localhost:27017/?directConnection=true
Waiting for MongoDB deployment to be ready...
Installing Python dependencies...
...
Running Python script...
Creating collection movies
Inserting data into collection movies
Creating vector search index
Waiting for vector index on field "embedding" to be created

Searching for: What movies are scary?

Movie title: The Halloween Tree
Plot: Four children learn the origins of Halloween customs while trying to save the life of their friend.

Movie title: Monster Brawl
Plot: Eight classic monsters fight to the death in an explosive wrestling tournament set inside an abandoned and cursed graveyard.

Movie title: Stay Tuned
Plot: A husband and wife are sucked into a hellish TV and have to survive a gauntlet of twisted versions of TV shows they find themselves in.

Enter a search term/sentence:
```


## Desclaimer

**Not a MongoDB Product, use at your own risk as a demo project**

