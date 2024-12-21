# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
resource "aws_acmpca_certificate_authority" "RootCertificateAuthority" {
    depends_on = [ var.s3_crl_bucket_id ]

    tags = var.tags

    type = var.root_ca_type

    certificate_authority_configuration {
        key_algorithm = var.key_algorithm
        signing_algorithm = var.signing_algorithm
        subject {
            common_name         = var.root_ca_common_name
            country             = var.root_ca_country
            state               = var.root_ca_state
            locality            = var.root_ca_locality
            organization        = var.root_ca_org
            organizational_unit = var.root_ca_ou
        }
    }

    # permanent_deletion_time_in_days = 7

    revocation_configuration {
        crl_configuration {
            enabled             = true
            expiration_in_days  = 3
            s3_bucket_name      = var.s3_crl_bucket_id
            s3_object_acl       = "BUCKET_OWNER_FULL_CONTROL"
        }
    }
}

resource "aws_acmpca_certificate" "RootCertificate" {
    depends_on = [ aws_acmpca_certificate_authority.RootCertificateAuthority ]

    certificate_authority_arn   = aws_acmpca_certificate_authority.RootCertificateAuthority.arn
    certificate_signing_request = aws_acmpca_certificate_authority.RootCertificateAuthority.certificate_signing_request
    signing_algorithm           = var.signing_algorithm
    template_arn                = var.template_arn

    validity {
        type  = var.root_validity_type
        value = var.root_validity_value
    }
}

resource "aws_acmpca_certificate_authority_certificate" "RootCertificateAuthorityCertificate" {
    certificate_authority_arn = aws_acmpca_certificate_authority.RootCertificateAuthority.arn
    certificate       = aws_acmpca_certificate.RootCertificate.certificate
    certificate_chain = aws_acmpca_certificate.RootCertificate.certificate_chain
}

