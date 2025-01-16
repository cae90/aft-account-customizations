// Copyright Amazon.com, Inc. or its a:w:ffiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0
####DR

resource "aws_kms_key" "custom_kms_audit_manager_dr" {
  description             = "Audit Manager KMS key DR"
  enable_key_rotation     = true
  rotation_period_in_days = 365
  policy                  = data.aws_iam_policy_document.assessment_kms_policy_document.json
}

resource "aws_kms_alias" "custom_kms_audit_manager_alias_dr" {
  name          = "alias/audit-manager-key-dr"
  target_key_id = aws_kms_key.custom_kms_audit_manager_dr.key_id
}

resource "aws_auditmanager_account_registration" "audit_account_registration_dr" {
  kms_key = aws_kms_key.custom_kms_audit_manager_dr.arn
}

module "s3_bucket_assessment_dr" {
  source                     = "./modules/s3_bucket_assessment-dr"
  aws_region                 = data.aws_region.current.name
  aws_account_id             = data.aws_caller_identity.current.account_id
  s3_logging_bucket_id       = var.s3_logging_bucket_id
  audit_manager_kms_arn      = aws_kms_key.custom_kms_audit_manager_dr.arn
  audit_manager_owner_role   = var.audit_manager_owner_role
}

module "audit_manager_assessment_dr" {
  source                     = "./modules/audit_manager_assessment-dr"
  for_each                   = toset(var.assessment_account_ids)
  assessment_account_id      = each.value
  s3_assessment_bucket_id    = module.s3_bucket_assessment_dr.s3_assessment_bucket_id
  audit_manager_owner_role   = var.audit_manager_owner_role
}