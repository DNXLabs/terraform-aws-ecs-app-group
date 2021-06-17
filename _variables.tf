variable "name" {
  description = "Name of your ECS service"
}

variable "cluster_name" {
  description = "Name of existing ECS Cluster to deploy this app to"
}

variable "hostnames" {
  description = "Hostnames to create DNS record for this app that the cloudfront distribution will accept"
}

variable "hostname_create" {
  description = "Create hostnames in the hosted zone passed?"
  default     = true
}

variable "hosted_zone" {
  description = "Existing Hosted Zone domain to add hostnames as DNS records"
}

variable "alb_cloudfront_key" {
  description = "Key generated by terraform-aws-ecs module to allow ALB connection from CloudFront"
}

variable "alb_dns_name" {
  description = "ALB DNS Name that CloudFront will point as origin"
}

variable "certificate_arn" {
  description = "Certificate for this app to use in CloudFront (US), must cover `hostname`."
}

variable "cloudfront_web_acl_id" {
  default     = ""
  description = "Optional web acl (WAF) to attach to CloudFront"
}

variable "cloudfront_forward_headers" {
  default     = ["*"]
  description = "Headers to forward to origin from CloudFront"
}

variable "cloudfront_logging_bucket" {
  type        = string
  default     = null
  description = "Bucket to store logs from app"
}

variable "cloudfront_logging_prefix" {
  type        = string
  default     = ""
  description = "Logging prefix"
}

variable "cloudfront_origin_keepalive_timeout" {
  default     = 5
  description = "The amount of time, in seconds, that CloudFront maintains an idle connection with a custom origin server before closing the connection. Valid values are from 1 to 60 seconds."
}

variable "cloudfront_origin_read_timeout" {
  default     = 30
  description = "The amount of time, in seconds, that CloudFront waits for a response from a custom origin. The value applies both to the time that CloudFront waits for an initial response and the time that CloudFront waits for each subsequent packet. Valid values are from 4 to 60 seconds."
}

variable "alarm_cloudfront_500_errors_threshold" {
  default     = 5
  description = "Cloudfront 500 Errors rate threshold (use 0 to disable this alarm)"
}

variable "alarm_sns_topics_us" {
  default     = []
  description = "Alarm topics to create and alert on metrics on US region"
}

variable "iam_certificate_id" {
  description = "Specifies IAM certificate id for CloudFront distribution"
  type        = string
  default     = null
}

variable "minimum_protocol_version" {
  description = <<EOF
    The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. 
    One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018. Default: TLSv1.2_2018. 
    NOTE: If you are using a custom certificate (specified with acm_certificate_arn or iam_certificate_id), 
    and have specified sni-only in ssl_support_method, TLSv1 or later must be specified. 
    If you have specified vip in ssl_support_method, only SSLv3 or TLSv1 can be specified. 
    If you have specified cloudfront_default_certificate, TLSv1 must be specified.
    EOF

  type    = string
  default = "TLSv1.2_2018"
}

variable "restriction_type" {
  description = "The restriction type of your CloudFront distribution geolocation restriction. Options include none, whitelist, blacklist"
  type        = string
  default     = "none"
}

variable "restriction_location" {
  description = "The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)"
  type        = list(any)
  default     = []
}

variable "dynamic_custom_origin_config" {
  description = "Configuration for the custom origin config to be used in dynamic block"
  type        = any
  default     = []
}

variable "dynamic_ordered_cache_behavior" {
  description = "Ordered Cache Behaviors to be used in dynamic block"
  type        = any
  default     = []
}
