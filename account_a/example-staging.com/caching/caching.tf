resource "cloudflare_ruleset" "cache_settings_example" {
  zone_id = "0da42c8d2132a9ddaf714f9e7c920711"
  # ...
  phase = "http_request_cache_settings"

  rules {
    action = "set_cache_settings"
    # ...
  }
}
