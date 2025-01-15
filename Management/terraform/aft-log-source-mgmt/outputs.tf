# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

#########################################
# AWS Subscription Policy CloudWatch Logs
#########################################

output "aws_cw_subscription_filter_name" {
    value = aws_cloudwatch_log_subscription_filter.cwlogs_logfilter_ctrail.name
}