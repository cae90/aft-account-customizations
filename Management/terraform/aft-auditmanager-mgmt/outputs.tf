# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

#########################################
# AWS Organization Policy Attachment Object
#########################################

output "aws_admin_account_registration" {
    value = aws_auditmanager_organization_admin_account_registration.delegated_admin.admin_account_id
}