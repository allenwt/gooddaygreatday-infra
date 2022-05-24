
module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = ">= 2.0"

  zones = {
    "www.gooddaygreatday.com" = {
      comment = "Good Day Great Day www zone created by Terraform"
      tags = {
        env       = "production"
        managedBy = "terraform"
      }
    }

    #     "gooddaygreatday.com" = {
    #       comment = "Good Day Great Day naked zone created by Terraform"
    #       tags = {
    #         env       = "production"
    #         managedBy = "terraform"
    #       }
    #     }
    #   }
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = ">= 2.0"

  records = [
    {
      name = "www.gooddaygreatday.com"
      type = "A"
      alias = {
        name    = module.s3_bucket.s3_bucket_website_domain
        zone_id = module.s3_bucket.s3_bucket_hosted_zone_id
      }
    },
  ]
}

