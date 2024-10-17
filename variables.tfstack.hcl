variable "region" {
  type        = string
  description = "The region in which the resource group will be created."
}
variable "name" {
  type        = string
  description = "The name of the resource group."

}

variable "env" {
  type        = set(string)
  description = "The environment in which the resource group will be created."
}
