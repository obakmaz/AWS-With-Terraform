variable "region" {
    default = "us-east-1"
}
# ---- storage variables ------
variable "project_name" {
    default = "la-terraform"
}
variable "aws_access_key" {}
variable "aws_secret_key" {}
# ------- VPC variables ----------
variable "vpc_cidr" {
    default = "10.123.0.0/16"
}

variable "public_cidrs" {
    type = list
    default = ["10.123.1.0/24", "10.123.2.0/24"]
}

variable "accesip" {
     default = "0.0.0.0/0"
}
