# resource "aws_acm_certificate" "gdgd_cert" {
#   domain_name       = var.domain_name
#   validation_method = "DNS"

#   tags = {
#     Environment = "prod"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# module "acm" {
#   source  = "terraform-aws-modules/acm/aws"
#   version = ">= 3.0"

#   domain_name = var.domain_name
#   zone_id     = aws_route53_zone.gdgd_public_zone.zone_id

#   subject_alternative_names = [
#     "*.gooddaygreatday.com",
#   ]

#   wait_for_validation = true

#   tags = {
#     Name = var.domain_name
#   }
# }
