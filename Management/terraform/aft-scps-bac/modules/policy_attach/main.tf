// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_organizations_policy_attachment" "this" {
  for_each  = { for policy in var.policy_id : policy.name => policy if contains(var.policies, policy.name) }
  policy_id = each.value.id
  target_id = var.ou
}
