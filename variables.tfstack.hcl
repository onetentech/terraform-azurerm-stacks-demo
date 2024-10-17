variable "name" {
  type = string
}
variable "region" {
  type = string
}
variable "env" {
  type = set(string)
}
variable "TFC_ARM_CLIENT_ID" {
  type      = string
  ephemeral = true
  default   = ""
}
variable "TFC_ARM_CLIENT_SECRET" {
  type      = string
  ephemeral = true
  default   = ""
}
variable "TFC_ARM_TENANT_ID" {
  type      = string
  ephemeral = true
  default   = ""
}
