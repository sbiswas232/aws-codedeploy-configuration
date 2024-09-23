variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "ap-southeast-1"
}


variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ami_id" {
  description = "AMI ID of the Linux distribution to use for EC2 instance"
  type        = string
  default     = "ami-01811d4912b4ccb26" # on Linux 2 AMI
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access to EC2"
  type        = string
  default     = "exam23sgp"            # Replace with your key pair name
}
