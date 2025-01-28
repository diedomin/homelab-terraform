
resource "cloudflare_record" "dns_records" {
  for_each = { for i, record in var.dns_records : "${record.name}_${record.type}" => record }

  zone_id  = var.zone_id
  name     = each.value.name
  type     = each.value.type
  content  = each.value.content
  ttl      = each.value.ttl
  priority = lookup(each.value, "priority", null)
  proxied  = lookup(each.value, "proxied", false)
}

