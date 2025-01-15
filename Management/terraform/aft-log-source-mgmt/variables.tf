// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "ctrail_cwl_group" {
    type    = string
    description = "The cloudwatch log group name with the cloudtrail events"
}

variable "cwlogs_firehose_destination" {
    type    = string
    description = "arn of the cloudwatch log gestination created for firehose stream"
}
