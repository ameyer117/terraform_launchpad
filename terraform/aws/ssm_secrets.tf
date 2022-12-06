# Define an AWS Systems Manager parameter
resource "aws_ssm_parameter" "my_parameter" {
  name = "/my-app/db/password"
  type = "SecureString"
  value = "my-password"
}

# Retrieve the parameter value at runtime
data "aws_ssm_parameter" "my_parameter_value" {
  name = aws_ssm_parameter.my_parameter.name
}

# Use the parameter value in an output
output "my_parameter_value" {
  value = data.aws_ssm_parameter.my_parameter_value.value
}
