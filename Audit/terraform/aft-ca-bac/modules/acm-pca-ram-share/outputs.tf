# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
output "ram_resource_share_arn" {
    value = aws_ram_resource_share.ram_resource_share.arn
}
