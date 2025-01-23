# # Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# # SPDX-License-Identifier: Apache-2.0
# #
module "s3-access-logs-bucket" {
    source = "./aft-ca-bac/modules/s3-access-logs-bucket"

        aws_region = "us-east-1"
        account_id = data.aws_caller_identity.current.account_id
}

module "s3-access-logs-bucket-dr" {
    source = "./aft-ca-bac/modules/s3-access-logs-bucket-dr"

        aws_region = "us-east-2"
        account_id = data.aws_caller_identity.current.account_id
    #providers aws.DR file aft-providers-dr.jinja
    providers = {
        aws = aws.DR
        }
}

# # module "aft-ca-development" {

# #     source = "./aft-ca-bac/ca-development"

# #     aws_region  = "us-east-1"
# #     service     = "aws-private-ca-dev"
# #     direccion   = "D.R. xxxxxxx"
# #     gerencia    = "Transformacion xxxxxx"
# #     proyecto    = "xxxxx"
# #     centroCostos = "xxxxxx"
# #     responsable = "xxxxxx"
# #     ambiente    = "xxxxxx"
# #     servicio    = "xxxxxx"
# #     idCargoSAP  = "xxxxxxxxx"
# #     s3_logging_bucket_id = module.s3-access-logs-bucket.s3_logging_bucket_id
# # }

# module "aft-ca-production" {

#     source = "./aft-ca-bac/ca-production"

#     aws_region  = "us-east-1"
#     service     = "aws-private-ca-prod"
#     direccion   = "D.R. xxxxxx"
#     gerencia    = "xxxxxx"
#     proyecto    = "xxxxxx"
#     centroCostos = "xxxxx"
#     responsable = "xxxxxx"
#     ambiente    = "xxxxxx"
#     servicio    = "xxxxxxx"
#     idCargoSAP  = "xxxxxxx"
#     s3_logging_bucket_id = module.s3-access-logs-bucket.s3_logging_bucket_id
# }

# # module "aft-ca-production-dr" {

# #     source = "./aft-ca-bac/ca-production-dr"

# #     aws_region  = "us-east-2"
# #     service     = "aws-private-ca-prod-dr"
# #     direccion   = "xxxxxx"
# #     gerencia    = "xxxxxx"
# #     proyecto    = "xxxxxx"
# #     centroCostos = "xxxxxx"
# #     responsable = "xxxxxx"
# #     ambiente    = "xxxxx"
# #     servicio    = "xxxxx"
# #     idCargoSAP  = "xxxxx"
# #     s3_logging_bucket_id = module.s3-access-logs-bucket-dr.s3_logging_bucket_id
# #     #arn root ca
# #     arn         = module.aft-ca-production.root_ca_arn_pr
# #     #providers file aft-providers-dr.jinja
# #     providers = {
# #         aws = aws.DR
# #         aws.oregon = aws
# #     }
    
# # }

# module "aft-auditmanager-tgt"{
#     source ="./aft-auditmanager-tgt"

#     audit_manager_owner_role = [ 
        
#         "arn:aws:iam::120569618617:role/aws-reserved/sso.amazonaws.com/us-west-2/AWSReservedSSO_AWSAdministratorAccess_be5b0692b485908a",
#         "arn:aws:iam::120569618617:role/aws-reserved/sso.amazonaws.com/us-west-2/AWSReservedSSO_AWSPowerUserAccess_f7ac7c69e0f997a0"
        
#         ]
#     s3_logging_bucket_id =  module.s3-access-logs-bucket.s3_logging_bucket_id
#     assessment_account_ids = ["984761018131", "739240486781"]
#     direccion   = "D.R. xxxxxx"
#     gerencia    = "xxxxxx"
#     proyecto    = "xxxxxx"
#     centroCostos = "xxxxx"
#     responsable = "xxxxxx"
#     ambiente    = "xxxxxx"
#     servicio    = "xxxxxxx"
#     idCargoSAP  = "xxxxxxx"
# }

# module "aft-auditmanager-tgt-dr"{
#     source ="./aft-auditmanager-tgt-dr"

#     audit_manager_owner_role = [ 
        
#         "arn:aws:iam::120569618617:role/aws-reserved/sso.amazonaws.com/us-west-2/AWSReservedSSO_AWSAdministratorAccess_be5b0692b485908a",
#         "arn:aws:iam::120569618617:role/aws-reserved/sso.amazonaws.com/us-west-2/AWSReservedSSO_AWSPowerUserAccess_f7ac7c69e0f997a0"
        
#         ]
#     s3_logging_bucket_id =  module.s3-access-logs-bucket-dr.s3_logging_bucket_id
#     assessment_account_ids = ["984761018131", "739240486781"]
#     direccion   = "D.R. xxxxxx"
#     gerencia    = "xxxxxx"
#     proyecto    = "xxxxxx"
#     centroCostos = "xxxxx"
#     responsable = "xxxxxx"
#     ambiente    = "xxxxxx"
#     servicio    = "xxxxxxx"
#     idCargoSAP  = "xxxxxxx"
#     providers = {
#         aws = aws.DR
# #        aws.oregon = aws
#     }
# }