# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# S3 Access Logs Bucket
resource "aws_s3_bucket" "logging-bucket" {
  bucket = "access-logging-bucket-dr-${var.account_id}-${var.aws_region}"
}

resource "aws_s3_bucket_policy" "logging-bucket-policy" {
  bucket = aws_s3_bucket.logging-bucket.id
  policy = data.aws_iam_policy_document.logging-bucket-policy-document.json
}