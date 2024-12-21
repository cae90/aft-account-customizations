# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

data "aws_auditmanager_framework" "pci_40" {
    name           = "Payment Card Industry Data Security Standard (PCI DSS) v4.0"
    framework_type = "Standard"
}