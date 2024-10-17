variable "env" {
  type = map(object({
    environment     = string
    subscription_id = string
    default_region  = string
  }))
  description = "A map of Azure subscriptions to use for the deployment."
}
variable "name" {
  type        = string
  description = "The name of the resource group."

}
