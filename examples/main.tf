# Find relevant commit hash from https://github.com/haakond/terraform-aws-chatbot/commits/main/
module "aws_chatbot_slack" {
  source = "git::https://github.com/haakond/terraform-aws-chatbot.git?ref=a8bd5199e06a694dc3b625b31520f8431f01c2e6"
  providers = {
    aws           = aws
    aws.us-east-1 = aws.us-east-1
    awscc         = awscc
  }
  slack_channel_configuration_name = "slack-hed-aws-monitoring"
  slack_channel_id                 = "AABBCC001122DD88"
  slack_workspace_id               = "ABCD1234EFGH5678"
  logging_level                    = "INFO"
}