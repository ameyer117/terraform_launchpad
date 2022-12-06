#!/usr/bin/env bash

# Upgrade pip
python -m pip install --upgrade pip

# Create a new virtual environment for the layer
python -m venv layer-env

# Activate the virtual environment (macOS/Linux)
source layer-env/bin/activate

# Install the required packages from the requirements.txt file
pip install -r --upgrade requirements.txt -t layer-env/python

# Zip the contents of the virtual environment into a file
zip -r layer.zip layer-env/python

# Clean up the virtual environment
rm -rf layer-env

# make sure to change perms for this script
chmod +x build-layer.sh

# then run ./build-layer.sh
./build-layer.sh
