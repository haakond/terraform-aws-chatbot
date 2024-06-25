# Find relevant commit hash from https://github.com/haakond/terraform-aws-chatbot/commits/main/
module "aws_chatbot_slack" {
  source = "git::https://github.com/haakond/terraform-aws-chatbot.git?ref=f769d98ff5495819290bbd82dd53f40d711e4cfb"
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