# ALB resources
resource "aws_alb" "guestbook_lb" {
    internal           = false
    load_balancer_type = "application"
    subnets            = "${var.public_subnets_ids}"
    security_groups    = ["${aws_security_group.http_from_anywhere.id}"]

    tags = {
        Name        = "${var.env}-guestbook-lb"
        Application = "guestbook"
        Environment = "${var.env}"
    }
}

resource "aws_alb_listener" "guestbook_alb_listener" {
    load_balancer_arn = "${aws_alb.guestbook_lb.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action{
        type = "forward"
        target_group_arn = "${aws_alb_target_group.guestbook_app_tg.arn}"
    }
}

resource "aws_alb_target_group" "guestbook_app_tg" {
    port    = "80"
    protocol = "HTTP"
    vpc_id  = "${var.vpc_id}"

    tags = {
        Name        = "${var.env}-guestbook_tg"
        Application = "guestbook"
        Environment = "${var.env}"
    }
}

# Security group for ELB
resource "aws_security_group" "http_from_anywhere" {
    vpc_id = "${var.vpc_id}"

    # Everything out
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # HTTP from anywhere
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.env}-guestbook-lb-sg"
        Application = "guestbook"
        Environment = "${var.env}"
    }
}