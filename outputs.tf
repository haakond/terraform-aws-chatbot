output "awscc_chatbot_slack_channel_configuration_arn" {
  value       = awscc_chatbot_slack_channel_configuration.chatbot_slack.arn
  description = "AWS Chatbot Slack channel configuration ARN"
  sensitive   = false
}

output "chatbot_channel_iam_role_arn" {
  value       = awscc_iam_role.chatbot_channel_role.arn
  description = "AWS Chatbot channel IAM role ARN"
  sensitive   = false
}

output "chatbot_sns_topic_arn_primary_region" {
  value       = aws_sns_topic.sns_topic_for_aws_chatbot_primary_region.arn
  description = "AWS Chatbot SNS topic ARN in primary region."
  sensitive   = false
}
