# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
locals {
    account_id = data.aws_caller_identity.current.account_id
    aws_region = data.aws_region.current.name
    common_tags = {
        Direccion   = var.direccion
        Gerencia    = var.gerencia
        Proyecto    = var.proyecto
        CentroCostos = var.centroCostos
        Responsable = var.responsable
        Ambiente    = var.ambiente
        Servicio    = var.servicio
        IDCargoSAP  = var.idCargoSAP
    }
}