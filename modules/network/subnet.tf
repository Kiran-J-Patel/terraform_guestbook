# Public subnets
resource "aws_subnet" "public_subnet_az_a" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_a_public}"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2a"

    tags = {
        Name        = "${var.env}-public-subnet-az-a"
        Application = "global"
        Environment = "${var.env}"
    }
}

resource "aws_subnet" "public_subnet_az_b" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_b_public}"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2b"

    tags = {
        Name        = "${var.env}-public-subnet-az-b"
        Application = "global"
        Environment = "${var.env}"
    }
}

resource "aws_subnet" "public_subnet_az_c" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_c_public}"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2c"

    tags = {
        Name        = "${var.env}-public-subnet-az-c"
        Application = "global"
        Environment = "${var.env}"
    }
}

# Public NAT subnet
resource "aws_subnet" "nat_public_subnet" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_nat_public}"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2a"

    tags = {
        Name        = "${var.env}-nat-public-subnet"
        Application = "global"
        Environment = "${var.env}"
    }
}

# Private subnets
resource "aws_subnet" "private_subnet_az_a" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_a_private}"
    availability_zone = "eu-west-2a"

    tags = {
        Name        = "${var.env}-private-subnet-az-a"
        Application = "global"
        Environment = "${var.env}"
    }
}

resource "aws_subnet" "private_subnet_az_b" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_b_private}"
    availability_zone = "eu-west-2b"

    tags = {
        Name        = "${var.env}-private-subnet-az-b"
        Application = "global"
        Environment = "${var.env}"
    }
}

resource "aws_subnet" "private_subnet_az_c" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    cidr_block = "${var.network_cidr_subnet_az_c_private}"
    availability_zone = "eu-west-2c"

    tags = {
        Name        = "${var.env}-private-subnet-az-c"
        Application = "global"
        Environment = "${var.env}"
    }
}