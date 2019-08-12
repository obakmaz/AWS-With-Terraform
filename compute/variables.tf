variable "key_name" {}

variable "public_key_path" {
    #default = "/Users/ozalbakmaz/.ssh/id_rsa.pub"
}

variable "subnet_ips" {
    type = "list"
}

variable "instance_count"{}

variable "instance_type"{}
variable "security_group"{}
variable "subnets"{
    type = "list"
}

variable "region" {}


variable "project_name" {
    default = "la-terraform"
}


