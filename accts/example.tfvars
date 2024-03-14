domain       = "example.com"
email        = "username@protonmail.com"
telegram_token="ABC:XYZ"
telegram_chat_id="1111111"

tunnels = {
  0 = {
    prevent_destroy = false
  }
}
services = [
  {
    name = "btcpay"
    onion_address = "XXX.onion"
    port  = 9081
    subdomain   = "store"
  },
  {
    name = "jellyfin"
    onion_address = "XXX.onion"
    port  = 9085
    subdomain   = "media"
  },  
  {
    name = "s9_pages"
    onion_address = "XXX.onion"
    port  = 9087
    subdomain   = "shared"
  },
]

tags = {
  account = "homelab"
}

