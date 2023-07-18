resource "cloudflare_record" "example" {
  zone_id = var.cloudflare_zone_id
  # ...
}
