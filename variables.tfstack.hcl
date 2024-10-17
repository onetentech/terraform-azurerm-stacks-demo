variable "name" {
  type = string
}
variable "region" {
  type = string
}
variable "env" {
  type = set(string)
}
variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_TENANT_ID" {}
