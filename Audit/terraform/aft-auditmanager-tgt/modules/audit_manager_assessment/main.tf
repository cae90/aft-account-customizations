# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

resource "aws_auditmanager_assessment" "assessment_pci_40" {
    name = "Assessment PCI 4.0"

    description = "This assessment validates the accounts in scope of pci compliance"

    assessment_reports_destination {
        destination      = "s3://${var.s3_assessment_bucket_id}"
        destination_type = "S3"
    }

    roles {
        role_arn  = "${var.audit_manager_owner_role[0]}"
        role_type = "PROCESS_OWNER"
    }

    roles {
        role_arn  = "${var.audit_manager_owner_role[1]}"
        role_type = "PROCESS_OWNER"
    }

    framework_id = data.aws_auditmanager_framework.pci_40.id

    scope {
        aws_accounts {
            id = var.assessment_account_id
        }
    }
}