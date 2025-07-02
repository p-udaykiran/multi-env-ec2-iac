#dev-infra
module "dev-infra" {
    source = "/home/uday/terraform/terraform_app-module/infra-app"
    env    = "dev"
    # Ensure the bucket name is unique across AWS
    bucket_name = "infra-app-bucket1"
    instance_count = 1
    instance_type = "t2.micro"
    ec2_ami_id = "ami-0f918f7e67a3323f0"  # Replace with a valid AMI ID for your region
    hash_key = "studentId"  # Example hash key for DynamoDB
    
}
#prod-infra
module "prod-infra" {
    source = "/home/uday/terraform/terraform_app-module/infra-app"
    env    = "prod"
    # Ensure the bucket name is unique across AWS
    bucket_name = "infra-app-bucket1"
    instance_count = 2
    instance_type = "t2.nano"
    ec2_ami_id = "ami-0f918f7e67a3323f0"  # Replace with a valid AMI ID for your region
    hash_key = "studentId"  # Example hash key for DynamoDB
    
}   
#stage-infra
module "stage-infra" {
    source = "/home/uday/terraform/terraform_app-module/infra-app"
    env    = "stage"
    # Ensure the bucket name is unique across AWS
    bucket_name = "infra-app-bucket1"
    instance_count = 1
    instance_type = "t2.micro"
    ec2_ami_id = "ami-0f918f7e67a3323f0"  # Replace with a valid AMI ID for your region
    hash_key = "studentId"  # Example hash key for DynamoDB
        
}