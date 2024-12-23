# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# S3 Bucket CA-CRL Configuration

module "s3-crl-bucket-pr-dr" {
    source = "../modules/s3-crl-bucket-pr-dr"

    # S3 Bucket CA-CRL Variables Values

    aws_account_id  = local.account_id
    aws_region      = local.aws_region
    s3_logging_bucket_id = var.s3_logging_bucket_id
    tags    = local.common_tags
}
# SUBODINATE AWS Private CA Configuration
module "acm-pca-intermediate-ca-dr" {
    source                     = "../modules/acm-pca-subordinate-ca-dr"

    # SUBORDINATE AWS Private CA Variable Values

    s3_crl_bucket_id           = module.s3-crl-bucket-pr-dr.s3_crl_bucket_dr_id
    root_ca_arn                = var.arn
    key_algorithm              = "RSA_2048"
    signing_algorithm          = "SHA256WITHRSA"
    subordinate_ca_type        = "SUBORDINATE"
    subordinate_validity_type  = "YEARS"
    subordinate_validity_value = 18
    template_arn               = "arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen1/V1"
    subordinate_ca_common_name = "Bac Credomatic Politicas CL PR-DR"
    subordinate_ca_country     = "CR"
    subordinate_ca_state       = "San Jose"
    subordinate_ca_locality    = "San Jose"
    subordinate_ca_org         = "BAC LATAM"
    subordinate_ca_ou          = "Seguridad"
    tags    = local.common_tags
    providers = {
        aws = aws.DR
        aws.virginia = aws
    }
}   
# SUBODINATE AWS Private CA  DR Configuration
module "acm-pca-subordinate-ca-dr" {
    source                     = "../modules/acm-pca-subordinate-ca-dr"

    # SUBORDINATE AWS Private CA Variable Values

    s3_crl_bucket_id           = module.s3-crl-bucket-pr-dr.s3_crl_bucket_dr_id
    root_ca_arn                = var.arn
    key_algorithm              = "RSA_2048"
    signing_algorithm          = "SHA256WITHRSA"
    subordinate_ca_type        = "SUBORDINATE"
    subordinate_validity_type  = "YEARS"
    subordinate_validity_value = 10
    template_arn               = "arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen0/V1"
    subordinate_ca_common_name = "Bac Credomatic Emisor CL PR-DR"
    subordinate_ca_country     = "CR"
    subordinate_ca_state       = "San Jose"
    subordinate_ca_locality    = "San Jose"
    subordinate_ca_org         = "BAC LATAM"
    subordinate_ca_ou          = "Seguridad"
    tags    = local.common_tags
    providers = {
        aws = aws.DR
        aws.virginia = aws
    }
}

module "acm-pca-ram-share-pr-dr" {
    source                    = "../modules/acm-pca-ram-share-pr-dr"
    ram_share_name            = "BACPCASubCAProdDRShare"
    allow_external_principals = false
    subordinate_ca_arn        = module.acm-pca-subordinate-ca-dr.subordinate_ca_arn_dr
    # If no value is specified resource is shared with Organization
    # Possible values are an AWS account ID, an AWS Organizations Organization ARN,
    # or an AWS Organizations Organization Unit ARN.
    allowed_principal = ["arn:aws:organizations::709566227538:ou/o-2wy5f36esm/ou-45du-qn0t5do1",
    "arn:aws:organizations::709566227538:ou/o-2wy5f36esm/ou-45du-0llrppjj"
    ]
    tags = local.common_tags
    }