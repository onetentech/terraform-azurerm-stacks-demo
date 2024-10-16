variable "env" {
  type = map(object({
    environment     = string
    subscription_id = string
    default_region  = string
  }))
  description = "A map of Azure subscriptions to use for the deployment."
}
