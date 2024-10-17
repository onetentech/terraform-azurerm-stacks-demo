variable "name" {
  type = string
}
variable "region" {
  type = string
}
variable "env" {
  type = set(string)
}
variable "ARM_CLIENT_ID" {
  type      = string
  ephemeral = true
}
variable "ARM_CLIENT_SECRET" {
  type      = string
  ephemeral = true
}
variable "ARM_TENANT_ID" {
  type      = string
  ephemeral = true
}
