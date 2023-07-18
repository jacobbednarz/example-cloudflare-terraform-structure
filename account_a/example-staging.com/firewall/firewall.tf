resource "cloudflare_ruleset" "zone_level_managed_waf_with_category_based_overrides" {
  zone_id = "0da42c8d2132a9ddaf714f9e7c920711"
  # ...
  phase = "http_request_firewall_managed"

  rules {
    action = "execute"
    # ...
  }
}
