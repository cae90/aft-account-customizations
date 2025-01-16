# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

output "s3_logging_bucket_id" {
    value = aws_s3_bucket.logging-bucket.id
}