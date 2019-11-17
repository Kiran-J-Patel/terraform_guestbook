# Internet Gateway
resource "aws_internet_gateway" "guestbook_igw" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"

    tags = {
        Name        = "${var.env}-guestbook-igw"
        Application = "global"
        Environment = "${var.env}"
    }
}