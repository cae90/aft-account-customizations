# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

variable "aws_region"{
    type        = string
    description = "Region where it's being deployed"
}

variable "aws_account_id"{
    type        = string
    description = "Accout ID where it's being deployed"
}

variable "s3_logging_bucket_id"{
    type        = string
    description = "name of the bucket used to store the access logs in the account"
}

variable "audit_manager_kms_arn"{
    type        = string
    description = "kms_arn of the customer managed key used to cipher the assessment"
}

variable "audit_manager_owner_role"{
    type        = list(string)
    description = "owner role allowed to execute and access the assessment"
}