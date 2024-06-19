data "aws_caller_identity" "current" {}
data "aws_canonical_user_id" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "sns_topic_policy_for_aws_chatbot" {
  policy_id = "__default_policy_ID"

  statement {
    sid    = "__default_statement_ID"
    effect = "Allow"
    actions = [
      "sns:Subscribe",
      "sns:SetTopicAttributes",
      "sns:RemovePermission",
      "sns:Receive",
      "sns:Publish",
      "sns:ListSubscriptionsByTopic",
      "sns:GetTopicAttributes",
      "sns:DeleteTopic",
      "sns:AddPermission",
    ]
    resources = [aws_sns_topic.sns_topic_for_aws_chatbot_primary_region.arn, aws_sns_topic.sns_topic_for_aws_chatbot_us_east_1.arn]

    principals {
      type        = "AWS"
      identifiers = [local.aws_account_id]
    }
  }
  statement {
    sid    = "PermittedServiceIntegrations"
    effect = "Allow"
    actions = [
      "sns:Publish"
    ]
    resources = [aws_sns_topic.sns_topic_for_aws_chatbot_primary_region.arn, aws_sns_topic.sns_topic_for_aws_chatbot_us_east_1.arn]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com", "cloudwatch.amazonaws.com", "ssm-incidents.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "sns_to_cw_logs_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "sns_to_cw_logs_policy" {
  #checkov:skip=CKV_AWS_356:
  #checkov:skip=CKV_AWS_111:
  statement {
    sid    = "AllowSNSToCloudWatchLogs"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutMetricFilter",
      "logs:PutRetentionPolicy"
    ]
    resources = ["*"]
  }
}
