# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "terraform_remote_state" "ca_production" {

  backend = "s3" 
    config = {
        region         = "{{ region }}"
        bucket         = "{{ bucket }}"
        key            = "{{ key }}"
        dynamodb_table = "{{ dynamodb_table }}"
        encrypt        = "true"
        kms_key_id     = "{{ kms_key_id }}"
        assume_role = {
        role_arn       = "{{ aft_admin_role_arn }}"
        }
    }
}