# Public subnets
resource "aws_subnet" "public_subnet_az_a" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_a_public}"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2a"

    tags = {
        Name        = "public-subnet-az-a"
        Application = "global"
    }
}

resource "aws_subnet" "public_subnet_az_b" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_b_public}"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2b"

    tags = {
        Name        = "public-subnet-az-b"
        Application = "global"
    }
}

resource "aws_subnet" "public_subnet_az_c" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_c_public}"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2c"

    tags = {
        Name        = "public-subnet-az-c"
        Application = "global"
    }
}

# Private subnets
resource "aws_subnet" "private_subnet_az_a" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_a_private}"
    availability_zone = "eu-west-2a"

    tags = {
        Name        = "private-subnet-az-a"
        Application = "global"
    }
}

resource "aws_subnet" "private_subnet_az_b" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_b_private}"
    availability_zone = "eu-west-2b"

    tags = {
        Name        = "private-subnet-az-b"
        Application = "global"
    }
}

resource "aws_subnet" "private_subnet_az_c" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_c_private}"
    availability_zone = "eu-west-2c"

    tags = {
        Name        = "private-subnet-az-c"
        Application = "global"
    }
}