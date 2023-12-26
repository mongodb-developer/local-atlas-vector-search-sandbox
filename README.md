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

## Desclaimer

**Not a MongoDB Product, use at your own risk as a demo project**

