# upload_files/main.tf

variable "bucket_id" {
  description = "The ID of the S3 bucket"
}

variable "base_dir" {
  description = "The path to the folder with the static"
}


module "template_files" {
  source   = "hashicorp/dir/template"
  base_dir = var.base_dir
}

resource "aws_s3_object" "object" {
  for_each     = module.template_files.files
  bucket       = var.bucket_id
  key          = each.key
  content_type = each.value.content_type
  source       = each.value.source_path
  content      = each.value.content
  etag         = each.value.digests.md5
}
