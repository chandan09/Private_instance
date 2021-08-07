
variable "aws_region" {
    default = "ap-south-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ec2"
}

variable "vpc_id" {
    description = "VPI ID"
    type        = string
    default     ="vpc-037b270ab03a6d576"
}
variable "environment" {
  default = "test"
}

variable "cidr_block" {
  default = "172.20.0.0/16"
}


variable "private_subnets" {
    description = "private_subnets"
    type        = string
    default     = "172.20.20.0/24"
}

variable "ami_id" {
  default = "ami-00bf4ae5a7909786c"
}

variable "private_instance_type" {
    description = "private_ec2_type"
    type        = string
    default     = "t2.micro"
}

variable "availability_zone" {
    description = "availability zone"
    default        = "ap-south-1a"
}
