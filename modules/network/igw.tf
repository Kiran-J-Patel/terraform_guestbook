# Internet Gateway
resource "aws_internet_gateway" "guestbook_igw" {
    vpc_id = "${aws_vpc.guestbook_vpc.id}"

    tags = {
        "Name"        = "guestbook-igW"
        "Application" = "global"
    }
}