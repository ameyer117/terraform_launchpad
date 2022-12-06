# Create a directory for the Lambda function code
mkdir example-function

# Write the code for the Lambda function
# (replace this with your own code)
echo 'exports.handler = function(event, context, callback) {
  callback(null, "Hello, world!");
};' > example-function/main.js

# Create a ZIP archive of the Lambda function code
zip -r function.zip example-function
