# ----- storage/main.tf ---------

# Creating a random ID.. since the bucket name should be unique
resource "random_id" "tf_bucket_id" {
    byte_length = 2
}

resource "aws_s3_bucket" "tf_code" {
    bucket = "${var.project_name}-${random_id.tf_bucket_id.dec}"
    acl = "private"
    force_destroy = true
    tags = {
        Name = "tf_bucket"
    }

}