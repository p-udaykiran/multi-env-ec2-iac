resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.env}-infra-dynamodb-table-1"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = "studentId"
    type = "S"
  }

  

  tags = {
    Name        = "${var.env}-infra-dynamodb-table-1"
    Environment = var.env
   
  }
}