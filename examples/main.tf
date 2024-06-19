module "aws_chatbot" {
  # Check https://github.com/haakond/terraform-aws-chatbot/commits/main/ for the latest hash and update accordingly.
  source = "git::https://github.com/haakond/terraform-aws-chatbot.git?ref=250fa4335eaff852ddc7d9fc40b7e62aea8ab1e6"
}