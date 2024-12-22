# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

#########################################
# S3 Acccess Logs Bucket Resources Deployed
#########################################

output "s3_logging_bucket_id" {
    value = module.s3-access-logs-bucket.s3_logging_bucket_id
}

#########################################
# CA Development and DR Resources Deployed
#########################################

# output "s3_crl_bucket_id" {
#     value = module.aft-ca-development.s3_crl_bucket_id
# }

# output "root_ca_arn" {
#      value = module.ca-production-dr.root_ca_arn
# }

# output "subordinate_ca_arn" {
#     value = module.aft-ca-development.subordinate_ca_arn
# }

# output "ram_resource_share_arn" {
#     value = module.aft-ca-development.ram_resource_share_arn
# }

# #########################################
# # AWS Audit Manager
# #########################################

# output "custom_kms_audit_manager_key_id" {
#     value = module.aft-auditmanager-tgt.custom_kms_audit_manager_key_id
# }

# output "audit_account_registration_id" {
#     value = module.aft-auditmanager-tgt.audit_account_registration_id
# }

# output "s3_assessment_bucket_id" {
#     value = module.aft-auditmanager-tgt.s3_assessment_bucket_id
# }
