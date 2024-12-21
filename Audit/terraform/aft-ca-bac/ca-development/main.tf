# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# S3 Bucket CA-CRL Configuration
module "s3-crl-bucket" {
  source = "../modules/s3-crl-bucket"

  # S3 Bucket CA-CRL Variables Values

  aws_account_id       = local.account_id
  aws_region           = local.aws_region
  s3_logging_bucket_id = var.s3_logging_bucket_id
  tags                 = local.common_tags
}

# ROOT AWS Private CA Configuration
module "acm-pca-root-ca" {
  source = "../modules/acm-pca-root-ca"

  #ROOT AWS Private CA Variables Values

  s3_crl_bucket_id    = module.s3-crl-bucket.s3_crl_bucket_id
  key_algorithm       = "RSA_4096"
  signing_algorithm   = "SHA384WITHRSA"
  root_ca_type        = "ROOT"
  root_validity_type  = "YEARS"
  root_validity_value = 20
  template_arn        = "arn:aws:acm-pca:::template/RootCACertificate/V1"
  root_ca_common_name = "Bac Credomatic Root CL DV"
  root_ca_country     = "CR"
  root_ca_state       = "San Jose"
  root_ca_locality    = "San Jose"
  root_ca_org         = "BAC LATAM"
  root_ca_ou          = "Seguridad"
  tags                = local.common_tags
}

# SUBODINATE AWS Private CA Configuration
module "acm-pca-subordinate-ca" {
  source = "../modules/acm-pca-subordinate-ca"

  # SUBORDINATE AWS Private CA Variable Values

  s3_crl_bucket_id           = module.s3-crl-bucket.s3_crl_bucket_id
  root_ca_arn                = module.acm-pca-root-ca.root_ca_arn
  key_algorithm              = "RSA_2048"
  signing_algorithm          = "SHA256WITHRSA"
  subordinate_ca_type        = "SUBORDINATE"
  subordinate_validity_type  = "YEARS"
  subordinate_validity_value = 10
  template_arn               = "arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen0/V1"
  subordinate_ca_common_name = "Bac Credomatic Emisor CL DV"
  subordinate_ca_country     = "CR"
  subordinate_ca_state       = "San Jose"
  subordinate_ca_locality    = "San Jose"
  subordinate_ca_org         = "BAC LATAM"
  subordinate_ca_ou          = "Seguridad"
  tags                       = local.common_tags
}

module "acm-pca-ram-share" {
  source                    = "../modules/acm-pca-ram-share"
  ram_share_name            = "BACPCASubCADevShare"
  allow_external_principals = false
  subordinate_ca_arn        = module.acm-pca-subordinate-ca.subordinate_ca_arn
  # If no value is specified resource is shared with Organization
  # Possible values are an AWS account ID, an AWS Organizations Organization ARN,
  # or an AWS Organizations Organization Unit ARN.
  allowed_principal = ["arn:aws:organizations::858830338572:ou/o-zup3x8i6qo/ou-mxcm-20m0g2zu" ,"arn:aws:organizations::858830338572:ou/o-zup3x8i6qo/ou-mxcm-wz62skgs"]
  tags = local.common_tags
}
