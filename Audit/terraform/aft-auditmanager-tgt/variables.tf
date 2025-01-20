// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "audit_manager_owner_role" {
    type    = list(string)
    description = "owner role for audit manager and assessment s3 access"
}

variable "s3_logging_bucket_id" {
    type    = string
    description = "id for the s3 access log in the current account"
}

variable "assessment_account_ids" {
    type    = list(string)
    description = "accounts included in the assessment"
}
variable "direccion" {
    type    = string
    description = "Tag de la direccion"
}

variable "gerencia" {
    type    = string
    description = "Tag de la gerencia"
}

variable "proyecto" {
    type    = string
    description = "Tag del proyecto"
}

variable "centroCostos" {
    type    = string
    description = "Tag del centro de costos del proyecto"
}

variable "responsable" {
    type    = string
    description = "Tag de responsable del proyecto"
}

variable "ambiente" {
    type    = string
    description = "Tag de ambiente de despliegue"
}

variable "servicio" {
    type    = string
    description = "Tag del area de servicio"
}

variable "idCargoSAP" {
    type    = string
    description = "Tag del ID de Cargo SAP"
}

