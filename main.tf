// Remote state setup

terraform {
    backend "s3" {
        bucket = "kp-terraform-remote-state"
        region = "eu-west-2"
        key    = "guestbook/guestbook-remote-state.tfstate"
    }
}

// Providers

provider "aws" {
    profile = "ops"
    region  = "eu-west-2"
}

// Hosted zone (previously registered domain)
data "aws_route53_zone" "automaticcloud" {
    name = "automaticcloud.co.uk."
}

module "network" {
    source                           = "./modules/network"
    env                              = "${var.env}"
    network_cidr_guestbook_vpc       = "${var.network_cidr_guestbook_vpc}"
    network_cidr_subnet_az_a_public  = "${var.network_cidr_subnet_az_a_public}"
    network_cidr_subnet_az_b_public  = "${var.network_cidr_subnet_az_b_public}"
    network_cidr_subnet_az_c_public  = "${var.network_cidr_subnet_az_c_public}"
    network_cidr_subnet_nat_public   = "${var.network_cidr_subnet_nat_public}"
    network_cidr_subnet_az_a_private = "${var.network_cidr_subnet_az_a_private}"
    network_cidr_subnet_az_b_private = "${var.network_cidr_subnet_az_b_private}"
    network_cidr_subnet_az_c_private = "${var.network_cidr_subnet_az_c_private}"
}

module "guestbook" {
    source                  = "./modules/guestbook"
    env                     = "${var.env}"
    vpc_id                  = "${module.network.vpc_id}"
    dns_zone_id             = "${data.aws_route53_zone.automaticcloud.id}"
    dns_base_fqdn           = "${data.aws_route53_zone.automaticcloud.name}"
    public_subnets_ids      = "${module.network.subnet_public_ids}"
    private_subnets_ids     = "${module.network.subnet_private_ids}"
    web_instance_type       = "${var.guestbook_web_instance_type}"
    ssh_key_name            = "${var.guestbook_ssh_key_name}"
    web_instance_user_data  = "${base64encode(var.guestbook_web_instance_user_data)}"
}
