# Route table (only VPC)
resource "aws_route_table" "guestbook_private_rt" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"

    tags = {
        "Name"        = "guestbook-private-rt"
        "Application" = "global"
    }
}

# Private route table by default
resource "aws_main_route_table_association" "private" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"
    route_table_id = "${aws_route_table.guestbook_private_rt.id}"
}

# Route table (to internet)
resource "aws_route_table" "guestbook_public_rt" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.guestbook_igw.id}"
    }

    tags = {
        "Name"        = "guestbook-public-rt"
        "Application" = "global"
    }
}

# Route table public subnets, all other subnets will be private (as default)
resource "aws_route_table_association" "public_subnet_az_a" {
    subnet_id      = "${aws_subnet.public_subnet_az_a.id}"
    route_table_id = "${aws_route_table.guestbook_public_rt.id}" 
}

resource "aws_route_table_association" "public_subnet_az_b" {
    subnet_id      = "${aws_subnet.public_subnet_az_b.id}"
    route_table_id = "${aws_route_table.guestbook_public_rt.id}" 
}

resource "aws_route_table_association" "public_subnet_az_c" {
    subnet_id      = "${aws_subnet.public_subnet_az_c.id}"
    route_table_id = "${aws_route_table.guestbook_public_rt.id}" 
}

