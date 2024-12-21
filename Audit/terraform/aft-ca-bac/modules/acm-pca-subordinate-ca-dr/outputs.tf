# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

output "subordinate_ca_arn_dr" {
    value = aws_acmpca_certificate_authority.SubordinateCertificateAuthority.arn
}