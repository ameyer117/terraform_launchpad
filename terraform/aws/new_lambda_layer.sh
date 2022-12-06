# Create a directory for the Lambda layer code
mkdir example-layer

# Write the code for the Lambda layer
# (replace this with your own code and dependencies)
echo 'def handler(event, context):
    return "Hello, world!"' > example-layer/main.py

# Create a requirements.txt file for the Lambda layer dependencies
# (replace this with your own dependencies)
echo 'requests' > example-layer/requirements.txt

# Install the dependencies for the Lambda layer
pip3 install -r example-layer/requirements.txt -t example-layer

# Create a ZIP archive of the Lambda layer code and dependencies
zip -r layer.zip example-layer
