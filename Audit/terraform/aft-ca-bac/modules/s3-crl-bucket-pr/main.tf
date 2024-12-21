# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# S3 CRL Bucket
resource "aws_s3_bucket" "crl-bucket-pr" {
    bucket = "acm-pca-ca-crl-bucket-prod-${var.aws_account_id}"
    force_destroy = true
    tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "crl-bucket-pr-public-access" {
    bucket = aws_s3_bucket.crl-bucket-pr.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

data "aws_iam_policy_document" "crl-bucket-pr-policy-document" {
    statement {
        actions = [
            "s3:GetBucketAcl",
            "s3:GetBucketLocation",
            "s3:PutObject",
            "s3:PutObjectAcl",
        ]

        resources = [
            aws_s3_bucket.crl-bucket-pr.arn,
            "${aws_s3_bucket.crl-bucket-pr.arn}/*",
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

resource "aws_s3_bucket_policy" "crl-bucket-policy-pr" {
    bucket = aws_s3_bucket.crl-bucket-pr.id
    policy = data.aws_iam_policy_document.crl-bucket-pr-policy-document.json
}

resource "aws_s3_bucket_versioning" "crl-bucket-pr-versioning" {
    bucket = aws_s3_bucket.crl-bucket-pr.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_logging" "crl-bucket-pr-logging" {
    bucket = aws_s3_bucket.crl-bucket-pr.id

    target_bucket = var.s3_logging_bucket_id
    target_prefix = "log/"
}