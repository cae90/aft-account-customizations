# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

output "s3_crl_bucket_dr_id" {
    value = module.s3-crl-bucket-pr-dr.s3_crl_bucket_dr_id
}
output "subordinate_ca_dr_arn" {
    value = module.acm-pca-subordinate-ca-dr.subordinate_ca_arn_dr
}
output "ram_resource_share_dr_arn" {
    value = module.acm-pca-ram-share-pr-dr.ram_resource_share_arn
}
