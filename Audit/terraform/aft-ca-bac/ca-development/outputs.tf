# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

output "s3_crl_bucket_id" {
    value = module.s3-crl-bucket.s3_crl_bucket_id
}

output "root_ca_arn" {
    value = module.acm-pca-root-ca.root_ca_arn
}

output "subordinate_ca_arn" {
    value = module.acm-pca-subordinate-ca.subordinate_ca_arn
}

output "ram_resource_share_arn" {
    value = module.acm-pca-ram-share.ram_resource_share_arn
}