# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
output "root_ca_arn" {
    value = aws_acmpca_certificate_authority.RootCertificateAuthority.arn
}