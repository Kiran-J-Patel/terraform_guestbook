variable "env" {
    default = "dev"
}
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

variable "guestbook_web_instance_type" {
    type = "string"
}

variable "guestbook_ssh_key_name" {
    type = "string"
}

variable "guestbook_web_instance_user_data" {
    type = "string"
}