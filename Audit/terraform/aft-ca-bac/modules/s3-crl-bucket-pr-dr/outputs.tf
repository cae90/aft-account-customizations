# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

output "s3_crl_bucket_dr_id" {
    value = aws_s3_bucket.crl-bucket-pr-dr.id
}