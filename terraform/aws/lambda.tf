# Create an AWS Lambda function
resource "aws_lambda_function" "example" {
  function_name = "example-function"
  runtime       = "python3.8"
  handler       = "main.handler"
  source_code_hash = filebase64sha256("function.zip")

  environment {
    variables = {
      EXAMPLE_VAR = "Hello, world!"
    }
  }
}
