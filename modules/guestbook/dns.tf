# Route53 resources
resource "aws_route53_record" "guestbook_app_record" {
    zone_id = "${var.dns_zone_id}"
    name    = "www.${var.dns_base_fqdn}"
    type    = "A"

    alias {
        name                    = "${aws_alb.guestbook_lb.dns_name}"
        zone_id                 = "${aws_alb.guestbook_lb.zone_id}"
        evaluate_target_health  = false
    }
}