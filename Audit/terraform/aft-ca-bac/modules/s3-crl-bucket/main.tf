# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# S3 CRL Bucket
resource "aws_s3_bucket" "crl-bucket" {
    bucket = "acm-pca-ca-crl-bucket-${var.aws_account_id}"
    force_destroy = true
    tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "crl-bucket-public-access" {
    bucket = aws_s3_bucket.crl-bucket.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

data "aws_iam_policy_document" "crl-bucket-policy-document" {
    statement {
        actions = [
            "s3:GetBucketAcl",
            "s3:GetBucketLocation",
            "s3:PutObject",
            "s3:PutObjectAcl",
        ]

        resources = [
            aws_s3_bucket.crl-bucket.arn,
            "${aws_s3_bucket.crl-bucket.arn}/*",
        ]

        principals {
            type        = "Service"  
            identifiers = [ "acm-pca.amazonaws.com" ]
        }

        condition {
            test        = "StringLike"
            variable    = "aws:SourceArn"
            values      = [ "arn:aws:acm-pca:${var.aws_region}:${var.aws_account_id}:certificate-authority/*" ]
        }
    }
}

resource "aws_s3_bucket_policy" "crl-bucket-policy" {
    bucket = aws_s3_bucket.crl-bucket.id
    policy = data.aws_iam_policy_document.crl-bucket-policy-document.json
}

resource "aws_s3_bucket_versioning" "crl-bucket-versioning" {
    bucket = aws_s3_bucket.crl-bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_logging" "crl-bucket-logging" {
    bucket = aws_s3_bucket.crl-bucket.id

    target_bucket = var.s3_logging_bucket_id
    target_prefix = "log/"
}