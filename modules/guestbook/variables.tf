# Environment resources
variable "env" {
    default = "dev"
}


# Network resources
variable "vpc_id" {
    type = "string"
}

variable "public_subnets_ids" {
    type = "list"
    description = "List of public subnets"
}

variable "private_subnets_ids" {
    type = "list"
    description = "List of private subnets"
}

# DNS resources
variable "dns_zone_id" {
    type = "string"
    description = "DNS zone id for Route53 record"
}

variable "dns_base_fqdn" {
    type = "string"
    description = "FQDN used for Route53 record"
}

# Instance resources
variable "web_instance_type" {
    type = "string"
    default = "t2.micro"
}

variable "ssh_key_name" {
    type = "string"
    default = "centos-base"
}

variable "web_instance_user_data" {
     type = "string"
     default = "#!/bin/bash \nsudo apt-get update -y"
}