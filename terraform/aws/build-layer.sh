#!/usr/bin/env bash

# Upgrade pip
python -m pip install --upgrade pip

# Create a new virtual environment for the layer
python -m venv layer-env

# Activate the virtual environment (macOS/Linux)
source layer-env/bin/activate

# Install the required packages from the requirements.txt file
pip install -r requirements.txt --upgrade -t layer-env/python

if command -v zip > /dev/null; then
    # Zip the contents of the virtual environment into a file
    zip -r layer.zip layer-env/python
else
    # Use 7-Zip to zip the contents of the virtual environment into a file (Windows)
    /c/Program\ Files/7-Zip/7z.exe a layer.zip layer-env/python
fi

# Clean up the virtual environment
rm -rf layer-env

# make sure to change perms for this script
# chmod +x build-layer.sh

# then run ./build-layer.sh
# ./build-layer.sh
