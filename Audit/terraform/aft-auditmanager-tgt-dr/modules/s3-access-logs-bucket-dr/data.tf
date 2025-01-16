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