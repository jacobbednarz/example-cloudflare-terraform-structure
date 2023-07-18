resource "cloudflare_load_balancer" "example" {
  zone_id = "0da42c8d2132a9ddaf714f9e7c920711"
  # ...
}

resource "cloudflare_load_balancer_pool" "example" {
  name = "example-lb-pool"
  # ...
}
