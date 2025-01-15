// Copyright Amazon.com, Inc. or its a:w:ffiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_auditmanager_organization_admin_account_registration" "delegated_admin" {
  admin_account_id = var.administrator_account_id
}
