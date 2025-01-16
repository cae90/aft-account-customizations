# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

#########################################
# AWS Audit Manager Assessment
#########################################

output "assessment_pci_40_id" {
    value = aws_auditmanager_assessment.assessment_pci_40.id
}

output "assessment_pci_40_scope" {
    value = aws_auditmanager_assessment.assessment_pci_40.scope
}