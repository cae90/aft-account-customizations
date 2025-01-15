// Copyright Amazon.com, Inc. or its a:w:ffiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_cloudwatch_log_subscription_filter" "cwlogs_logfilter_ctrail" {
    name            = "cwlogs-logfilter-ctrail"
    log_group_name  = var.ctrail_cwl_group
    destination_arn = var.cwlogs_firehose_destination
    filter_pattern  = "{($.eventName=DeleteGroupPolicy) || ($.eventName=DeleteRolePolicy) || ($.eventName=DeleteUserPolicy) || ($.eventName=PutGroupPolicy) || ($.eventName=PutRolePolicy) || ($.eventName=PutUserPolicy) || ($.eventName=CreatePolicy) || ($.eventName=DeletePolicy) || ($.eventName=CreatePolicyVersion) || ($.eventName=DeletePolicyVersion) || ($.eventName=AttachRolePolicy) || ($.eventName=DetachRolePolicy) || ($.eventName=AttachUserPolicy) || ($.eventName=DetachUserPolicy) || ($.eventName=AttachGroupPolicy) || ($.eventName=DetachGroupPolicy) || (($.eventSource=kms.amazonaws.com) && (($.eventName=DisableKey) || ($.eventName=ScheduleKeyDeletion))) || (($.eventName=ConsoleLogin) && ($.errorMessage=\"Failed authentication\"))}"
}
