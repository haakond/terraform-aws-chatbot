# terraform-aws-chatbot
terraform-aws-chatbot

# About
Terraform AWS sample module to provision AWS Chatbot integration with Slack.

# Providers
Requires both aws (AWS) and awscc (AWS Cloud Control) providers.

## Usage
1. Authorize Slack to your AWS account in the Console by following [Step 1: Configure a Slack client](https://docs.aws.amazon.com/chatbot/latest/adminguide/slack-setup.html#slack-client-setup).
1. See [examples/main.tf](examples/main.tf).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.84.0 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | ~> 1.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.84.0 |
| <a name="provider_aws.us-east-1"></a> [aws.us-east-1](#provider\_aws.us-east-1) | ~> 5.84.0 |
| <a name="provider_awscc"></a> [awscc](#provider\_awscc) | ~> 1.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.delivery_status_logging_for_sns_topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.delivery_status_logging_for_sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.delivery_status_logging_for_sns_topic_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sns_topic.sns_topic_for_aws_chatbot_primary_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic.sns_topic_for_aws_chatbot_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.sns_topic_policy_for_aws_chatbot_primary_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_policy.sns_topic_policy_for_aws_chatbot_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [awscc_chatbot_slack_channel_configuration.chatbot_slack](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/chatbot_slack_channel_configuration) | resource |
| [awscc_iam_role.chatbot_channel_role](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_iam_policy_document.sns_to_cw_logs_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns_to_cw_logs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns_topic_policy_for_aws_chatbot_primary_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns_topic_policy_for_aws_chatbot_us_east_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_slack_channel_configuration_name"></a> [slack\_channel\_configuration\_name](#input\_slack\_channel\_configuration\_name) | AWS Chatbot Slack channel configuration name. | `string` | n/a | yes |
| <a name="input_slack_channel_id"></a> [slack\_channel\_id](#input\_slack\_channel\_id) | Slack channel ID. | `string` | n/a | yes |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | Slack workspace ID - https://slack.com/help/articles/221769328-Locate-your-Slack-URL-or-ID | `string` | n/a | yes |
| <a name="input_logging_level"></a> [logging\_level](#input\_logging\_level) | AWS Chatbot integration CloudWatch Logs log level. | `string` | `"INFO"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_awscc_chatbot_slack_channel_configuration_arn"></a> [awscc\_chatbot\_slack\_channel\_configuration\_arn](#output\_awscc\_chatbot\_slack\_channel\_configuration\_arn) | AWS Chatbot Slack channel configuration ARN |
| <a name="output_chatbot_channel_iam_role_arn"></a> [chatbot\_channel\_iam\_role\_arn](#output\_chatbot\_channel\_iam\_role\_arn) | AWS Chatbot channel IAM role ARN |
| <a name="output_chatbot_sns_topic_arn_primary_region"></a> [chatbot\_sns\_topic\_arn\_primary\_region](#output\_chatbot\_sns\_topic\_arn\_primary\_region) | AWS Chatbot SNS topic ARN in primary region. |
| <a name="output_chatbot_sns_topic_arn_us_east_1"></a> [chatbot\_sns\_topic\_arn\_us\_east\_1](#output\_chatbot\_sns\_topic\_arn\_us\_east\_1) | AWS Chatbot SNS topic ARN in us-east-1. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

**Note**: The inputs and outputs sections are automatically generated by terraform-docs in a git pre-commit hook. This requires setup of [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform) . Follow the install instructions to use, including the dependencies setup. pre-commit ensures correct formatting, linting and generation of documentation. It also check's for trailing whitespace, merge conflics and mixed line endings. See [.pre-commit-config.yaml](./.pre-commit-config.yaml) for more information. A full guide to the pre-commit framework can be found [here](https://pre-commit.com/).

## Authors/contributors

See [contributors.](https://github.com/haakond/terraform-aws-chatbot/graphs/contributors)

## License

MIT licensed. See [LICENSE](LICENSE). Feel free to fork and make use of what you want.
