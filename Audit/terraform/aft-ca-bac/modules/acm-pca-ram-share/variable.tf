# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# Organization, OU, or Account Arn that the Subordinate CA is shared with
variable "allowed_principal" {
    type        = list
    description = "Possible values are an AWS account ID, an AWS Organizations Organization ARN, or an AWS Organizations Organization Unit ARN."
    default = [""]
}

variable "ram_share_name" {
    type        = string
    description = "Name of the RAM Share"
}

variable "allow_external_principals" {
    type        = bool
    description = "Allow external accounts access outside of Organization"
    default     = false
}

variable "subordinate_ca_arn" {
    type = string
}
variable "tags" {
    type        = map
    description = "Configuration tag for certificate"
}