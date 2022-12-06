provider "aws" {
  access_key = "your-access-key"
  secret_key = "your-secret-key"
}

resource "aws_dynamodb_table" "my-table" {
  name           = "my-table"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "timestamp"
    type = "N"
  }

  hash_key = "id"
  range_key = "timestamp"
}
