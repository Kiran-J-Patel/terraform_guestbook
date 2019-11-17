# Environment resources
variable "env" {
    default = "dev"
}

# Network resources
variable "network_cidr_guestbook_vpc" {
    type = "string"
}

variable "network_cidr_subnet_az_a_public" {
    type = "string"
}

variable "network_cidr_subnet_az_b_public" {
    type = "string"

}
variable "network_cidr_subnet_az_c_public" {
    type = "string"
}

variable "network_cidr_subnet_nat_public" {
    type = "string"
}

variable "network_cidr_subnet_az_a_private" {
    type = "string"
}

variable "network_cidr_subnet_az_b_private" {
    type = "string"
}

variable "network_cidr_subnet_az_c_private" {
    type = "string"
}
