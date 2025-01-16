# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

data "aws_auditmanager_framework" "pci_40" {
    name           = "AWS PCI DSS v4.0 Framework"
    framework_type = "Standard"
}