module "s3bucket" {
  source      = "./s3bucket" # Path to your S3 bucket module directory
  bucket_name = var.bucket_name
}

module "upload_files_example" {
  source    = "./uploadToS3" # Path to your upload files module directory
  bucket_id = module.s3bucket.bucket_id
  base_dir = var.base_dir
}

output "url" {
  value = module.s3bucket.bucket_url
}

