# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

#########################################
# AWS Audit Manager Configuration
#########################################

output "custom_kms_audit_manager_key_id" {
    value = aws_kms_key.custom_kms_audit_manager_dr.key_id
}

output "audit_account_registration_id" {
    value = aws_auditmanager_account_registration.audit_account_registration.id
}

#########################################
# AWS S3 Bucket Assessment
#########################################

output "s3_assessment_bucket_id" {
    value = module.s3_bucket_assessment.s3_assessment_bucket_id
}

#########################################
# AWS Audit Manager Assessment
#########################################

/* output "assessment_pci_40_id" {
    value = module.audit_manager_assessment.assessment_pci_40_id
}

output "assessment_pci_40_scope" {
    value = module.audit_manager_assessment.assessment_pci_40_scope
} */