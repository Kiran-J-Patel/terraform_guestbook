# VPC
resource "aws_vpc" "guestbook_vpc" {
    cidr_block           = "${var.network_cidr_guestbook_vpc}"
    enable_dns_hostnames = true

    tags = {
        "Name"        = "${var.env}-guestbook-vpc"
        "Application" = "global"
    }
}