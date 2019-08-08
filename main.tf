provider "aws" {
    version = "~> 2.0"
    region  = "${var.region}"
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
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