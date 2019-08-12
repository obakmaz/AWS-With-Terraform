provider "aws" {
    version = "~> 2.0"
    region  = "${var.region}"
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
}
# I want to keep my state files in S3 bucket 
terraform {
    backend "s3" {
        bucket = "bucket-to-be-saved-terraform-state-files"
        # will save terraform.tfstate file under terraform folder in s3 bucket
        key = "terraform/terraform.tfstate"  
        region = "us-east-1"  ### does not accept interpolations here like ${var.region}
    }

}

module "storage" {
    source = "./storage"
    project_name = "${var.project_name}"
}

module "vpc" {
    source = "./vpc"
    vpc_cidr = "${var.vpc_cidr}"
    public_cidrs = "${var.public_cidrs}"
    accessip = "${var.accesip}"
    region = "${var.region}"
}

module "compute" {
    source = "./compute"
    instance_count = "${var.instance_count}"
    key_name = "${var.key_name}"
    public_key_path = "${var.public_key_path}"
    instance_type = "${var.server_instance_type}"
    subnets = "${module.vpc.public_subnets}"
    security_group = "${module.vpc.public_sg}"
    subnet_ips = "${module.vpc.subnet_ips}"
    region = "${var.region}"
}