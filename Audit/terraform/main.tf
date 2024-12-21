# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
module "s3-access-logs-bucket" {
    source = "./aft-ca-bac/modules/s3-access-logs-bucket"

        aws_region = "us-east-1"
        account_id = data.aws_caller_identity.current.account_id
}

# module "s3-access-logs-bucket-dr" {
#     source = "./aft-ca-bac/modules/s3-access-logs-bucket-dr"

#         aws_region = "us-east-2"
#         account_id = data.aws_caller_identity.current.account_id
#    providers = {
#        aws = aws.DR
#    }
# }

# module "aft-ca-development" {

#     source = "./aft-ca-bac/ca-development"

#     aws_region  = "us-east-1"
#     service     = "aws-private-ca-dev"
#     direccion   = "D.R. Transformacion Digital"
#     gerencia    = "Transformacion Digital"
#     proyecto    = "MSN-5843"
#     centroCostos = "5053SSC"
#     responsable = "Jose Manuel Paez"
#     ambiente    = "Desarrollo"
#     servicio    = "Banca Digital"
#     idCargoSAP  = "REG.OP.24.101.03"
#     s3_logging_bucket_id = module.s3-access-logs-bucket.s3_logging_bucket_id
# }

module "aft-ca-production" {

    source = "./aft-ca-bac/ca-production"

    aws_region  = "us-east-1"
    service     = "aws-private-ca-prod"
    direccion   = "D.R. Transformacion Digital"
    gerencia    = "Transformacion Digital"
    proyecto    = "MSN-5843"
    centroCostos = "5053SSC"
    responsable = "Jose Manuel Paez"
    ambiente    = "Produccion"
    servicio    = "Banca Digital"
    idCargoSAP  = "REG.OP.24.101.03"
    s3_logging_bucket_id = module.s3-access-logs-bucket.s3_logging_bucket_id
}

module "aft-ca-production-dr" {

    source = "./aft-ca-bac/ca-production-dr"

    aws_region  = "us-east-2"
    service     = "aws-private-ca-prod-dr"
    direccion   = "D.R. Transformacion Digital"
    gerencia    = "Transformacion Digital"
    proyecto    = "MSN-5843"
    centroCostos = "5053SSC"
    responsable = "Jose Manuel Paez"
    ambiente    = "Produccion"
    servicio    = "Banca Digital"
    idCargoSAP  = "REG.OP.24.101.03"
    s3_logging_bucket_id = module.s3-access-logs-bucket-dr.s3_logging_bucket_id

    providers = {
        aws = aws.DR
}
    
}

# module "aft-auditmanager-tgt"{
#     source ="./aft-auditmanager-tgt"

#     audit_manager_owner_role = [ 
#         "arn:aws:iam::374165089831:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_AWSIAMAdmin_e542ee68e047edab",
#         "arn:aws:iam::374165089831:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_AWSAdministratorAccess_4246ad7f15449d67"
#         ]
#     s3_logging_bucket_id =  module.s3-access-logs-bucket.s3_logging_bucket_id
#     assessment_account_ids = ["992382711611", "339713170197"]
# }