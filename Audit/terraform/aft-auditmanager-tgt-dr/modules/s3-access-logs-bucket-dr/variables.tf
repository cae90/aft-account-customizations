# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

variable "aws_region" {
  type        = string
  description = "Region AWS"
}

variable "account_id" {
  type        = string
  description = "Account id AWS"
}

variable "tags" {
    type        = map
    description = "Configuration tag for certificate"
}