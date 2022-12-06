@echo off

rem Adding 7zip to path
set PATH=%PATH%;C:\Program Files\7-Zip

rem Upgrade pip
python -m pip install --upgrade pip

rem Create a new virtual environment for the layer
python -m venv layer-env

rem Activate the virtual environment
call layer-env/Scripts/activate.bat

rem Install the required packages from the requirements.txt file
pip install -r requirements.txt -t layer-env/python

rem Zip the contents of the virtual environment into a file
7z a -r layer.zip layer-env/python

rem Clean up the virtual environment
rd /s /q layer-env
