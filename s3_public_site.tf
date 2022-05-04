resource "aws_s3_bucket" "gooddaygreatday_public_site" {  
  bucket = "gooddaygreatday.com"   

  }


resource "aws_s3_bucket_website_configuration" "gdgd_public_site" {
  bucket = aws_s3_bucket.gooddaygreatday_public_site.id

  index_document {
    suffix = "index.png"
  }

  error_document {
    key = "error.html"
  }

  # routing_rule {
  #   condition {
  #     key_prefix_equals = "docs/"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "documents/"
  #   }
  # }
}

resource "aws_s3_bucket_acl" "gdgd_bucket_acl" {
  bucket = aws_s3_bucket.gooddaygreatday_public_site.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "gdgd_bucket_acl_bucket_policy" {  
  bucket = aws_s3_bucket.gooddaygreatday_public_site.id  
policy = <<POLICY
{    
    "Version": "2012-10-17",    
    "Statement": [        
      {            
          "Sid": "PublicReadGetObject",            
          "Effect": "Allow",            
          "Principal": "*",            
          "Action": [                
             "s3:GetObject"            
          ],            
          "Resource": [
             "arn:aws:s3:::${aws_s3_bucket.gooddaygreatday_public_site.id}/*"            
          ]        
      }    
    ]
}
POLICY
}