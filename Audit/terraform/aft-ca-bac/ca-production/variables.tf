# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
variable "aws_region" {
    type    = string
    description = "Region AWS"
}

variable "service" {
    type    = string
    description = "Tag del servicio AWS"
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

variable "s3_logging_bucket_id"{
    type        = string
    description = "name of the bucket used to store the access logs in the account"
}