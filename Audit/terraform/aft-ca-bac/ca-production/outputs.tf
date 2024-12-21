# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

output "s3_crl_bucket_pr_id" {
    value = module.s3-crl-bucket-pr.s3_crl_bucket_pr_id
}

output "root_ca_arn_pr" {
    value = module.acm-pca-root-ca.root_ca_arn
}

output "subordinate_ca_arn_pr" {
    value = module.acm-pca-subordinate-ca.subordinate_ca_arn
}

output "ram_resource_share_arn_prod" {
    value = module.acm-pca-ram-share-prod.ram_resource_share_arn
}
