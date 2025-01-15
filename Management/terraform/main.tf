# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# module "aft-scps-bac" {
#     source = "./aft-scps-bac"

#     ou_list = {
#         "r-mxcm" = ["scp-deny-permissions-members-accounts"] #root
#                 }
#     policies_directory_name = "policies"
# }

module "aft-auditmanager-mgmt"{
    source ="./aft-auditmanager-mgmt"

    administrator_account_id = "904692622892"
}

# module "aft-log-source-mgmt"{
#     source ="./aft-log-source-mgmt"

#     ctrail_cwl_group = "aws-controltower/CloudTrailLogs"
#     cwlogs_firehose_destination = "arn:aws:logs:us-east-1:12345678:destination:cwlogs_ctrail_firehose_destination"
# }