data "aws_iam_policy_document" "assessment_bucket_policy_document" {
    depends_on = [ aws_s3_bucket.assessment_bucket ]
    statement {
        sid = "AllowAccessToAuditManagerServiceandOwnerRole"
        actions = [
            "s3:GetBucketAcl",
            "s3:GetBucketLocation",
            "s3:PutObject",
            "s3:PutObjectAcl",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:DeleteObject",
            "s3:GetBucketLocation"
        ]

        resources = [
            aws_s3_bucket.assessment_bucket.arn,
            "${aws_s3_bucket.assessment_bucket.arn}/*",
        ]

        principals {
            type        = "Service"  
            identifiers = [ "auditmanager.amazonaws.com" ]
        }

        principals {
            type        = "AWS"  
            identifiers = var.audit_manager_owner_role
        }

        condition {
            test        = "StringEquals"
            variable    = "aws:SourceAccount"
            values      = [ "${var.aws_account_id}" ]
        }

        /* condition {
            test        = "StringLike"
            variable    = "aws:SourceArn"
            values      = [ "arn:aws:acm-pca:${var.aws_region}:${var.aws_account_id}:certificate-authority/*" ]
        } */
    }
    statement {
        sid = "DenyObjectsThatAreNotSSEKMSWithSpecificKey"
        principals {
        type = "*"
        identifiers = ["*"]
        }
        effect = "Deny"

        actions = [ 
            "s3:PutObject"
        ]

        resources = [
            "${aws_s3_bucket.assessment_bucket.arn}/*",
        ]

        condition {
            test = "ArnNotEqualsIfExists"
            variable = "s3:x-amz-server-side-encryption-aws-kms-key-id"
            values = ["${var.audit_manager_kms_arn}"]
        }
    }
    statement {
        sid = "AllowCloudTrailDeliverEvidenceFinderQuerryResults"
        effect = "Allow"
        principals {
            type        = "Service"  
            identifiers = [ "cloudtrail.amazonaws.com" ]
        }
        actions = [
            "s3:PutObject*",
            "s3:Abort*",
            "s3:GetBucketAcl"
        ]

        resources = [
            aws_s3_bucket.assessment_bucket.arn,
            "${aws_s3_bucket.assessment_bucket.arn}/*",
        ]

        condition {
            test        = "StringEquals"
            variable    = "aws:SourceArn"
            values      = [ "arn:aws:cloudtrail:${var.aws_region}:${var.aws_account_id}:eventdatastore/*" ]
        }
    }
}