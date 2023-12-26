#!/bin/bash

check_dependencies() {
    # Check for pip3
    which pip3 > /dev/null || { echo "pip3 not found. Please install pip3 and try again."; exit 1; }

    # Check for MongoDB Atlas CLI
    which atlas > /dev/null || { echo "MongoDB Atlas CLI not found. Please install MongoDB Atlas CLI and try again : https://www.mongodb.com/docs/atlas/cli/stable/install-atlas-cli/."; exit 1; }
}


check_dependencies

# Check if OpenAI API Key is passed as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <openai-api-key>"
    exit 1
fi

export OPENAI_API_KEY=$1

# Step 1: Install MongoDB Atlas CLI
echo "Installing MongoDB Atlas CLI..."
# Add the MongoDB Atlas CLI installation commands here

# Step 2: Set up local MongoDB deployment
echo "Setting up local MongoDB deployment..."

output=$(atlas deployments setup --type local --skipMongosh --force)

# Use grep to find the line with "Connection string", then cut to extract the URL
connection_string=$(echo "$output" | grep "Connection string" | cut -d' ' -f3)

# Now, $connection_string contains the URL
echo "The connection string is: $connection_string"
echo "Waiting for MongoDB deployment to be ready..."
sleep 10


# Step 3: Install Python packages
echo "Installing Python dependencies..."
pip3 install pymongo langchain openai asyncio


export MONGODB_ATLAS_CLUSTER_URI=$connection_string

# Step 5: Run Python script
echo "Running Python script..."
python3 main.py
