# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
resource "aws_ram_resource_share" "ram_resource_share" {
    name                      = var.ram_share_name
    allow_external_principals = var.allow_external_principals
    tags = var.tags
}

resource "aws_ram_resource_association" "resource_association_ram_resource_share" {
    resource_arn       = var.subordinate_ca_arn
    resource_share_arn = aws_ram_resource_share.ram_resource_share.arn
}

resource "aws_ram_principal_association" "principal_association_ram_resource_share" {
    for_each = toset(var.allowed_principal)
    depends_on = [ aws_ram_resource_association.resource_association_ram_resource_share ]
    
    principal          = each.value
    resource_share_arn = aws_ram_resource_share.ram_resource_share.arn
}
