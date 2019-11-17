# Autoscaling and EC2 resources

resource "aws_launch_template" "guestbook_lt" {
    name            = "${var.env}-guestbook-lt"
    description     = "Launch template for guestbook application"
    image_id        = "${data.aws_ami.ubuntu.id}"
    instance_type   = "${var.web_instance_type}"
    key_name        = "${var.ssh_key_name}"
    user_data       = "${var.web_instance_user_data}"

    network_interfaces {
        associate_public_ip_address = false
        security_groups             = ["${aws_security_group.http_from_lb.id}"]
    }

    tag_specifications {
        resource_type = "instance"
        tags = {
            Name        = "${var.env}-guestbook-ec2-instance"
            Application = "guestbook"
            Environment = "${var.env}"
        }
    }
}

resource "aws_autoscaling_group" "guestbook_app_asg" {
    name = "${var.env}-guestbook-asg"
    desired_capacity = 1
    max_size = 1
    min_size = 1
    vpc_zone_identifier = "${var.private_subnets_ids}"

    launch_template {
        id = "${aws_launch_template.guestbook_lt.id}"
        version = "$Latest"
    }

    tag {
        key = "Application"
        value = "guestbook"
        propagate_at_launch = false
    }

    tag {
        key = "Environment"
        value = "${var.env}"
        propagate_at_launch = false
    }
}

resource "aws_autoscaling_attachment" "guestbook_asg_attachment" {
    autoscaling_group_name = "${aws_autoscaling_group.guestbook_app_asg.id}"
    alb_target_group_arn = "${aws_alb_target_group.guestbook_app_tg.id}"
}

# Latest ubuntu image
data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name    = "name"
        values  = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }
    filter {
        name    = "virtualization-type"
        values  = ["hvm"]
    }
    owners      = ["099720109477"]
}

# Security group for EC2 instances
resource "aws_security_group" "http_from_lb" {
    vpc_id = "${var.vpc_id}"

    # Everything out
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # HTTP from load balancer security group
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        security_groups = ["${aws_security_group.http_from_anywhere.id}"]
    }

    tags = {
        Name        = "${var.env}-guestbook-ec2-sg"
        Application = "guestbook"
        Environment = "${var.env}"
    }
}