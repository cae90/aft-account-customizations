#####
# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# S3 Bucket Assessment
resource "aws_s3_bucket" "assessment_bucket" {
    bucket = "audit-manager-assessment-bucket-${var.aws_account_id}"
    force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "assessment_bucket_public_access" {
    bucket = aws_s3_bucket.assessment_bucket.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_server_side_encryption_configuration" "assessment_bucket_encryption" {
    bucket = aws_s3_bucket.assessment_bucket.id

    rule {
        apply_server_side_encryption_by_default {
        kms_master_key_id = var.audit_manager_kms_arn
        sse_algorithm     = "aws:kms"
        }
    }
}

resource "aws_s3_bucket_policy" "assessment_bucket_policy" {
    bucket = aws_s3_bucket.assessment_bucket.id
    policy = data.aws_iam_policy_document.assessment_bucket_policy_document.json
}

resource "aws_s3_bucket_versioning" "assessment_bucket_versioning" {
    bucket = aws_s3_bucket.assessment_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_logging" "assessment_bucket_logging" {
    bucket = aws_s3_bucket.assessment_bucket.id

    target_bucket = var.s3_logging_bucket_id
    target_prefix = "log/"
}