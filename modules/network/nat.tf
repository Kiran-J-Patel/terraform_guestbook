# NAT gateway resources
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = "${aws_eip.nat_eip.id}"
    subnet_id = "${aws_subnet.nat_public_subnet.id}"
    depends_on = ["aws_internet_gateway.guestbook_igw"]
}

resource "aws_eip" "nat_eip" {
    vpc = true
    depends_on = ["aws_internet_gateway.guestbook_igw"]
}