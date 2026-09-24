 resource "aws_route53_record" "terraform-new" {
  for_each = var.instances
 #count           = length(var.instances)
  zone_id         = var.zone_id
  name            = "${each.key}.id.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = [aws_instance.terraform-new[each.key].private_ip]
  allow_overwrite = true
}


resource "aws_route53_record" "frontend" {
  zone_id         = var.zone_id
  name            = "${var.project}.${var.domain_name}"   # roboshop.daws-90s.shop
  type            = "A"
  ttl             = 1
  records         = [aws_instance.terraform-new["frontend"].public_ip]
  allow_overwrite = true
}