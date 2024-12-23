# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# Subordinate CA
resource "aws_acmpca_certificate_authority" "SubordinateCertificateAuthority" {
    type = var.subordinate_ca_type
    tags = var.tags
    certificate_authority_configuration {
        key_algorithm     = var.key_algorithm
        signing_algorithm = var.signing_algorithm

        subject {
        common_name         = var.subordinate_ca_common_name
        country             = var.subordinate_ca_country
        state               = var.subordinate_ca_state
        locality            = var.subordinate_ca_locality
        organization        = var.subordinate_ca_org
        organizational_unit = var.subordinate_ca_ou
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

# Subordinate CA Certificate

resource "aws_acmpca_certificate" "SubordinateCertificate" {
    # provider = aw.virginia
    depends_on = [ aws_acmpca_certificate_authority.SubordinateCertificateAuthority ]

    certificate_authority_arn   = var.root_ca_arn
    certificate_signing_request = aws_acmpca_certificate_authority.SubordinateCertificateAuthority.certificate_signing_request
    signing_algorithm           = var.signing_algorithm
    template_arn                = var.template_arn

    validity {
        type  = var.subordinate_validity_type
        value = var.subordinate_validity_value
    }
}

resource "aws_acmpca_certificate_authority_certificate" "subordinate" {
    # provider = aws.DR
    certificate_authority_arn   = aws_acmpca_certificate_authority.SubordinateCertificateAuthority.arn
    certificate                 = aws_acmpca_certificate.SubordinateCertificate.certificate
    certificate_chain           = aws_acmpca_certificate.SubordinateCertificate.certificate_chain
}

resource "aws_acmpca_permission" "example" {
    certificate_authority_arn = aws_acmpca_certificate_authority.SubordinateCertificateAuthority.arn
    actions                   = ["IssueCertificate", "GetCertificate", "ListPermissions"]
    principal                 = "acm.amazonaws.com"
}