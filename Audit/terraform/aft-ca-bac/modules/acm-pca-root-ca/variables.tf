# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
variable "s3_crl_bucket_id" {
    type = string
    description = "name of the bucket used to store the acm-pca crl"
}

variable "root_ca_common_name" {
    type        = string
    description = "Common Name (CN) of the private Root CA"
}

variable "root_ca_country" {
    type        = string
    description = "Two-digit code that specifies the country in which the certificate subject located."
}

variable "root_ca_state" {
    type        = string
    description = "State in which the subject of the certificate is located."
}

variable "root_ca_locality" {
    type        = string
    description = "The locality (such as a city or town) in which the certificate subject is located."
}

variable "root_ca_org" {
    type        = string
    description = "Legal name of the organization with which the certificate subject is affiliated."
}

variable "root_ca_ou" {
    type        = string
    description = "A subdivision or unit of the organization (such as security or engineering) with which the certificate subject is affiliated."
}

variable "key_algorithm" {
    type        = string
    description = "Private CA Key Algorithm"
    validation {
        condition     = can(regex("RSA_2048|RSA_4096|EC_prime256v1|EC_secp384r1", var.key_algorithm))
        error_message = "ERROR: key_algorithm must be RSA_2048|RSA_4096|EC_prime256v1|EC_secp384r1."
    }
}

variable "signing_algorithm" {
    type        = string
    description = "Key Signing Algorithm"
    validation {
        condition     = can(regex("SHA256WITHECDSA|SHA384WITHECDSA|SHA512WITHECDSA|SHA256WITHRSA|SHA384WITHRSA|SHA512WITHRSA", var.signing_algorithm))
        error_message = "ERROR: signing_algorithm must be SHA256WITHECDSA|SHA384WITHECDSA|SHA512WITHECDSA|SHA256WITHRSA|SHA384WITHRSA|SHA512WITHRSA."
    }
}

variable "root_ca_type" {
    type        = string
    description = "CA Type (ROOT or SUBORDINATE)"
    default = "ROOT"
}

variable "root_validity_type" {
    type        = string
    description = "DAYS|MONTHS|YEARS"
    validation {
        condition     = can(regex("DAYS|MONTHS|YEARS", var.root_validity_type))
        error_message = "ERROR: validity_type must be DAYS, MONTHS, or YEARS."
    }
}

variable "root_validity_value" {
    type        = number
    description = "Value for validity type"
    #default     = 10
}

variable "template_arn" {
    type        = string
    description = "Configuration template for certificate"
}

variable "tags" {
    type        = map
    description = "Configuration tag for certificate"
}