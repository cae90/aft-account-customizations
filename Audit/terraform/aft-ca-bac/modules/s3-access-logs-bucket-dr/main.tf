# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# S3 Access Logs Bucket
resource "aws_s3_bucket" "logging-bucket" {
  bucket = "access-logging-bucketdr${var.account_id}-${var.aws_region}"
}

data "aws_iam_policy_document" "logging-bucket-policy-document" {
  statement {
    actions = [
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.logging-bucket.arn,
      "${aws_s3_bucket.logging-bucket.arn}/*",
    ]

    principals {
      identifiers = ["logging.s3.amazonaws.com"]
      type        = "Service"
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [var.account_id]
    }
  }

  statement {
    actions = [
      "s3:*",
    ]

    effect = "Deny"

    resources = [
      aws_s3_bucket.logging-bucket.arn,
      "${aws_s3_bucket.logging-bucket.arn}/*",
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

resource "aws_s3_bucket_policy" "logging-bucket-policy" {
  bucket = aws_s3_bucket.logging-bucket.id
  policy = data.aws_iam_policy_document.logging-bucket-policy-document.json
}