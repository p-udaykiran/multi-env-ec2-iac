variable "env" {
  description = "value of environment"
  type = string
}

variable "bucket_name" {
  description = "value of bucket name for my s3"
    type = string
    
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type = number
  default = 1
    
}

variable "instance_type" {
  description = "Type of EC2 instance to create"
  type = string
  default = "t2.micro"
  
}
variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type = string
 
  
}
variable "hash_key" {
  description = "Hash key for the DynamoDB table"
  type = string
  
  
}