locals {
    region_shortcode = {
        uksouth = "uks"
        ukwest  = "ukw"
    }
  landingzones = {
    hub = {
      subscription_id = "3c828e3e-a2fc-44f2-b3d2-abcce0792d79"
      client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
      tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
    }
    alz001 = {
      subscription_id = "de706246-7701-45d8-9039-c4d720e7a39b"
      client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
      tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
    }
    alz002 = {
      subscription_id = "5201c2d1-b62c-4952-bdf8-beaef29a7559"
      client_id       = "7c0fca0b-148a-4038-aab7-5083b652ee35"
      tenant_id       = "6e08c3a8-c390-4c74-b63a-561a04e9babb"
    }
  }
}