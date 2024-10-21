
deployment "hub" {
  inputs = {
    env           = ["dev"]
    region        = "uksouth"
    address_space = ["10.10.10.0/24"]
  }
}
deployment "alz001" {
  inputs = {
    env           = ["alz001"]
    region        = "uksouth"
    address_space = ["10.10.11.0/24"]
  }
}
deployment "alz002" {
  inputs = {
    env           = ["alz002"]
    region        = "uksouth"
    address_space = ["10.10.11.0/24"]
  }
}
