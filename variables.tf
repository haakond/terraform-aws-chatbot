variable "slack_channel_configuration_name" {
  type        = string
  description = "AWS Chatbot Slack channel configuration name."
}

variable "slack_channel_id" {
  type        = string
  description = "Slack channel ID."
}

variable "slack_workspace_id" {
  type        = string
  description = "Slack workspace ID - https://slack.com/help/articles/221769328-Locate-your-Slack-URL-or-ID"
}

variable "slack_logging_level" {
  type        = string
  default     = "INFO"
  description = "Chatbot Slack integration CloudWatch Logs log level."
  validation {
    condition     = contains(["INFO", "ERROR", "NONE"], var.slack_logging_level)
    error_message = "Valid values: INFO, ERROR or NONE."
  }
}
