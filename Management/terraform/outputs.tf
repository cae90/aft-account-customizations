# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

#########################################
# aft scps bac
#########################################


# output "aws_organizations_policy_attachment" {
#     value = module.aft-scps-bac.aws_organizations_policy_attachment
# }

#########################################
# aft auditmanager bac
#########################################

output "aws_admin_account_registration" {
    value = module.aft-auditmanager-mgmt.aws_admin_account_registration
}

#########################################
# aft log source bac
#########################################

# output "aws_cw_subscription_filter_name" {
#     value = module.aft-log-source-mgmt.aws_cw_subscription_filter_name
# }