# Network vars 
env = "dev"

# Network module resources
network_cidr_guestbook_vpc = "10.0.0.0/16"

network_cidr_subnet_az_a_public = "10.0.0.0/24"
network_cidr_subnet_az_b_public = "10.0.1.0/24"
network_cidr_subnet_az_c_public = "10.0.2.0/24"

network_cidr_subnet_az_a_private = "10.0.3.0/24"
network_cidr_subnet_az_b_private = "10.0.4.0/24"
network_cidr_subnet_az_c_private = "10.0.5.0/24"

network_cidr_subnet_nat_public  = "10.0.6.0/24"

# Guestbook module resources
guestbook_web_instance_type       = "t2.micro"
guestbook_ssh_key_name            = "centos-base"
