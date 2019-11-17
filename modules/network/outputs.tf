# Outputs from terraform
output "vpc_id" {
    value = "${aws_vpc.guestbook_vpc.id}"
}

output "subnet_public_az_a_id" {
    value = "${aws_subnet.public_subnet_az_a.id}"
}

output "subnet_public_az_b_id" {
    value = "${aws_subnet.public_subnet_az_b.id}"
}

output "subnet_public_az_c_id" {
    value = "${aws_subnet.public_subnet_az_c.id}"
}

output "subnet_private_az_a_id" {
    value = "${aws_subnet.private_subnet_az_a.id}"
}

output "subnet_private_az_b_id" {
    value = "${aws_subnet.private_subnet_az_b.id}"
}

output "subnet_private_az_c_id" {
    value = "${aws_subnet.private_subnet_az_c.id}"
}

output "subnet_private_ids" {
    value = [
        "${aws_subnet.private_subnet_az_a.id}",
        "${aws_subnet.private_subnet_az_b.id}",
        "${aws_subnet.private_subnet_az_c.id}",
    ]
}

output "subnet_public_ids" {
    value = [
        "${aws_subnet.public_subnet_az_a.id}",
        "${aws_subnet.public_subnet_az_b.id}",
        "${aws_subnet.public_subnet_az_c.id}",
    ]
}
