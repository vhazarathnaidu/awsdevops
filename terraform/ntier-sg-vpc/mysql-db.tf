resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "pfuser"
  password             = "pfpassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}