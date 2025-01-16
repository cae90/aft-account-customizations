# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_iam_policy_document" "assessment_kms_policy_document" {
    statement {
        sid = "EnableIAMUserPermissions"
        effect = "Allow"
        actions = [
            "kms:*"
        ]

        resources = [ "*" ]

        principals {
            type        = "AWS"  
            identifiers = [ "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" ]
        }
    }
    statement {
        sid = "AllowaccessforKeyAdministrators"
        effect = "Allow"
        principals {
            type = "AWS"
            identifiers = var.audit_manager_owner_role
        }
        actions = [
            "kms:Create*",
            "kms:Describe*",
            "kms:Enable*",
            "kms:List*",
            "kms:Put*",
            "kms:Update*",
            "kms:Revoke*",
            "kms:Disable*",
            "kms:Get*",
            "kms:Delete*",
            "kms:TagResource",
            "kms:UntagResource",
            "kms:ScheduleKeyDeletion",
            "kms:CancelKeyDeletion",
            "kms:RotateKeyOnDemand"
        ]
        resources = [ "*" ]
    }
    statement {
        sid = "Allowuseofthekey"
        effect = "Allow"
        principals {
            type = "AWS"
            identifiers = var.audit_manager_owner_role
        }

        actions = [
            "kms:Encrypt",
            "kms:Decrypt",
            "kms:ReEncrypt*",
            "kms:GenerateDataKey*",
            "kms:DescribeKey"
        ]
        resources = [ "*" ]

        condition {
            test        = "StringEquals"
            variable    = "kms:ViaService"
            values      = [ 
                "s3.${data.aws_region.current.name}.amazonaws.com",
                "dynamodb.${data.aws_region.current.name}.amazonaws.com",
                "auditmanager.${data.aws_region.current.name}.amazonaws.com",
            ]
        }

        /* condition {
            test        = "StringLike"
            variable    = "aws:SourceArn"
            values      = [ "arn:aws:acm-pca:${var.aws_region}:${var.aws_account_id}:certificate-authority/*" ]
        } */
    }
    statement {
        sid = "AllowuseofthekeyCloudtrail"
        effect = "Allow"
        principals {
            type        = "Service"  
            identifiers = [ "cloudtrail.amazonaws.com" ]
        }

        actions = [
            "kms:Encrypt",
            "kms:Decrypt",
            "kms:ReEncrypt*",
            "kms:GenerateDataKey*",
            "kms:DescribeKey"
        ]
        resources = [ "*" ]

        condition {
            test        = "StringEquals"
            variable    = "aws:SourceAccount"
            values      = [ "${data.aws_caller_identity.current.account_id}" ]
        }

        /* condition {
            test        = "StringLike"
            variable    = "aws:SourceArn"
            values      = [ "arn:aws:acm-pca:${var.aws_region}:${var.aws_account_id}:certificate-authority/*" ]
        } */
    }

    statement {
        sid = "Allowattachmentofpersistentresources"
        effect = "Allow"
        principals {
            type = "AWS"
            identifiers = var.audit_manager_owner_role
        }
        actions = [
            "kms:CreateGrant",
            "kms:ListGrants",
            "kms:RevokeGrant"
        ]
        resources = [ "*" ]

        condition {
            test        = "StringEquals"
            variable    = "kms:ViaService"
            values      = [ "auditmanager.${data.aws_region.current.name}.amazonaws.com" ]
        }
        condition {
            test        = "Bool"
            variable    = "kms:GrantIsForAWSResource"
            values      = [ true ]
        } 
    }
}