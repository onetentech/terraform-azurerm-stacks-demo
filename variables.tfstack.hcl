variable "env" {
  type = map(object({
    address_space = list(string)
    location      = string
  }))
  description = <<EOF
  The environment configuration for the networks, must contain at least one key named "hub".
  ```hcl
  env = {
    hub = {
      address_space = ["10.10.10.0/24"]
      location      = "uksouth"
    }
  }
  ```
  EOF
}

variable "identity_token" {
  type      = string
  ephemeral = true
}
