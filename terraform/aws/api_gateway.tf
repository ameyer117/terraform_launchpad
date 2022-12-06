# Create an API Gateway
resource "aws_api_gateway_rest_api" "example" {
  name = "example-api"
}

# Create a deployment for the API Gateway
resource "aws_api_gateway_deployment" "example" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  stage_name  = "prod"
}

/*
/items
/items/{id}

is the same as (essentially)

/items/{proxy+}
*/

# Create a route for the API Gateway
resource "aws_api_gateway_resource" "example" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  parent_id   = aws_api_gateway_rest_api.example.root_resource_id
  path_part   = "{proxy+}"
}



# Create a method for the API Gateway route
resource "aws_api_gateway_method" "example" {
  rest_api_id   = aws_api_gateway_rest_api.example.id
  resource_id   = aws_api_gateway_resource.example.id
  http_method   = "GET"
  authorization = "NONE"
}

# Create an integration between the API Gateway and the Lambda function
resource "aws_api_gateway_integration" "example" {
  rest_api_id             = aws_api_gateway_rest_api.example.id
  resource_id             = aws_api_gateway_resource.example.id
  http_method             = aws_api_gateway_method.example.http_method
  type                    = "AWS"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.example.invoke_arn
}
