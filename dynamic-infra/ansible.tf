# Variables for access and secret key
variable "aws_access_key" {}
variable "aws_secret_key" {}

# Provider Info
provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Ansible Master
resource "aws_instance" "ansible-master" {
   ami = "ami-02358d9f5245918a3"
   instance_type= "t2.micro"
   subnet_id= "subnet-086da6a52c5c6d04e"
   vpc_security_group_ids = ["sg-01e63e4bed8e29708"]  #ssh - check in security group for ref
   key_name= "manish_key"
   user_data = file("install-ansible.sh")
   private_ip= "172.31.80.20"
   tags = {
      Name= "Ansible Master"
    }
}

# Ansible Node1
resource "aws_instance" "node1" {
   ami = "ami-02358d9f5245918a3"
   instance_type= "t2.micro"
   subnet_id = "subnet-086da6a52c5c6d04e"
   vpc_security_group_ids = ["sg-044a10fb6dc274b10"]  #ssh and http client_loop: send disconnect: Connection reset by peer
   key_name= "manish_key"
    private_ip= "172.31.80.21"
   tags = {
      Name= "node1"
    }
}

# Ansible Node2
resource "aws_instance" "node2" {
   ami = "ami-02358d9f5245918a3"
   instance_type= "t2.micro"
   subnet_id = "subnet-086da6a52c5c6d04e"
   vpc_security_group_ids = ["sg-044a10fb6dc274b10"]  #ssh and http client_loop: send disconnect: Connection reset by peer
   key_name= "manish_key"
    private_ip= "172.31.80.22"
   tags = {
      Name= "node2"
    }
}

