provider "aws" {
  region = "eu-west-2"
}

resource "aws_db_instance" "default" {
  identifier           = "will-demo-db-tf"
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "12.5"
  instance_class       = "db.t2.micro"
  name                 = "demoa"
  username             = "postgres"
  password             = "${var.password}"
  parameter_group_name = "default.postgres12"
  skip_final_snapshot  = true
  db_subnet_group_name = "will-db-subnet"
  vpc_security_group_ids = ["sg-016ba6c8b1dac48be"]
  publicly_accessible = true
}

variable "password" {
  description = "db_password"
}

output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "db_username" {
  value = aws_db_instance.default.username
}
