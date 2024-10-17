deployment "development" {
  inputs = {
    name = "development_rg_oneten"
    env = {
      environment     = "Development"
      subscription_id = "de706246-7701-45d8-9039-c4d720e7a39b"
      default_region  = "uksouth"
    }
  }
}
