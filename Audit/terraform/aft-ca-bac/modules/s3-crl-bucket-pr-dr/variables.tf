# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

variable "aws_region" {
    type    = string
    description = "Region AWS"
   
}

variable "aws_account_id"{
    type        = string
    description = "Accout ID where it's being deployed"
}

variable "s3_logging_bucket_id"{
    type        = string
    description = "name of the bucket used to store the access logs in the account"
}
variable "tags" {
    type        = map
    description = "Configuration tag for certificate"
}