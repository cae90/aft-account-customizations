# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

variable "s3_assessment_bucket_id"{
    type        = string
    description = "name of the bucket used to store the assessment"
}

variable "audit_manager_owner_role"{
    type        = list(string)
    description = "owner role allowed to access audit manager content"
}

variable "assessment_account_id"{
    type        = string
    description = "Accout IDs in scope of the assessment"
}