# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

#########################################
# AWS Organization Policy Attachment Object
#########################################

output "aws_organizations_policy_attachment" {
    value = module.policy_attach
}