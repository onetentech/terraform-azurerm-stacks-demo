data "external" "env" {
  program = ["${path.module}/env.sh"]

  # For Windows (or Powershell core on MacOS and Linux),
  # run a Powershell script instead
  #program = ["${path.module}/env.ps1"]
}
deployment "development" {
  inputs = {
    env    = ["dev"]
    region = "uksouth"
    name   = "devteststacks"

  }
}
