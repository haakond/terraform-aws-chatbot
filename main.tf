resource "awscc_chatbot_slack_channel_configuration" "chatbot_slack" {
  configuration_name = var.slack_channel_configuration_name
  iam_role_arn       = awscc_iam_role.chatbot_channel_role.arn
  slack_channel_id   = var.slack_channel_id
  slack_workspace_id = var.slack_workspace_id
  logging_level      = var.logging_level
  sns_topic_arns     = [aws_sns_topic.sns_topic_for_aws_chatbot_primary_region.arn]
  guardrail_policies = [
    "arn:aws:iam::aws:policy/PowerUserAccess"
  ]
}

resource "awscc_iam_role" "chatbot_channel_role" {
  role_name = "aws-chatbot-channel-role"
  assume_role_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "Chatbot"
        Principal = {
          Service = "chatbot.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSResourceExplorerReadOnlyAccess",
    "arn:aws:iam::aws:policy/AWSIncidentManagerResolverAccess",
    "arn:aws:iam::aws:policy/AmazonQFullAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    "arn:aws:iam::aws:policy/AWSSecurityHubFullAccess",
    "arn:aws:iam::aws:policy/AWSSupportAccess"
  ]
}

resource "aws_sns_topic" "sns_topic_for_aws_chatbot_primary_region" {
  #checkov:skip=CKV_AWS_26:
  name                           = "aws-chatbot-notifications"
  http_success_feedback_role_arn = aws_iam_role.delivery_status_logging_for_sns_topic.arn
  http_failure_feedback_role_arn = aws_iam_role.delivery_status_logging_for_sns_topic.arn
  tags = {
    Name    = "aws_chatbot_notifications"
    Service = "monitoring"
  }
}


# Define SNS topic policy primary region
resource "aws_sns_topic_policy" "sns_topic_policy_for_aws_chatbot_primary_region" {
  arn    = aws_sns_topic.sns_topic_for_aws_chatbot_primary_region.arn
  policy = data.aws_iam_policy_document.sns_topic_policy_for_aws_chatbot.json
}


# IAM role for delivery_status_logging_for_sns_topic
resource "aws_iam_role" "delivery_status_logging_for_sns_topic" {
  name               = "aws-chatbot-delivery-status-logging"
  assume_role_policy = data.aws_iam_policy_document.sns_to_cw_logs_assume_role_policy.json
}

resource "aws_iam_policy" "delivery_status_logging_for_sns_topic_policy" {
  policy = data.aws_iam_policy_document.sns_to_cw_logs_policy.json
}

resource "aws_iam_role_policy_attachment" "delivery_status_logging_for_sns_topic_attachment" {
  role       = aws_iam_role.delivery_status_logging_for_sns_topic.name
  policy_arn = aws_iam_policy.delivery_status_logging_for_sns_topic_policy.arn
}
