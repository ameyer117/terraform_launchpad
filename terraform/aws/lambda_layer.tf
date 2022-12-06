# Create an AWS Lambda layer
resource "aws_lambda_layer_version" "example" {
  layer_name = "example-layer"
  description = "An example Lambda layer"
  compatible_runtimes = ["python3.8"]
  source_code_hash = filebase64sha256("layer.zip")
}

# Create an AWS Lambda function
resource "aws_lambda_function" "example" {
  function_name = "example-function"
  runtime       = "python3.8"
  handler       = "main.handler"
  source_code_hash = filebase64sha256("function.zip")

  # Include the Lambda layer in the function
  layer {
    layer_name = aws_lambda_layer_version.example.layer_name
    version = aws_lambda_layer_version.example.version
  }

  environment {
    variables = {
      EXAMPLE_VAR = "Hello, world!"
    }
  }
}
