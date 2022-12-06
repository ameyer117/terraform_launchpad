# Create an RDS instance for PostgreSQL
resource "aws_db_instance" "example" {
  engine                     = "postgres"
  instance_class             = "db.t2.micro"
  allocated_storage          = 20
  storage_type               = "gp2"
  vpc_security_group_ids     = [aws_security_group.example.id]
  publicly_accessible        = true
  multi_az                   = false
  name                       = "example-database"
  username                   = "example"
  password                   = "example-password"
  parameter_group_name       = "default.postgres12"
  skip_final_snapshot        = true
  skip_final_snapshot_on_delete = true
}

# Create a security group for the RDS instance
resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Security group for the db"
}