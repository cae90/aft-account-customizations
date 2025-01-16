// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "audit_manager_owner_role" {
    type    = list(string)
    description = "owner role for audit manager and assessment s3 access"
}

variable "s3_logging_bucket_id" {
    type    = string
    description = "id for the s3 access log in the current account"
}

variable "assessment_account_ids" {
    type    = list(string)
    description = "accounts included in the assessment"
}


