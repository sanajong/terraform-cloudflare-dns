# A Records
resource "cloudflare_dns_record" "a_records" {
  for_each = var.a_records

  zone_id = var.zone_id
  name    = each.key
  content = each.value.content
  type    = "A"
  ttl     = lookup(each.value, "ttl", 1) # Use 1 for auto
  proxied = lookup(each.value, "proxied", true)
  comment = lookup(each.value, "comment", "Managed by Terraform")
  tags    = lookup(each.value, "tags", var.default_tags)
}

# CNAME Records
resource "cloudflare_dns_record" "cname_records" {
  for_each = var.cname_records

  zone_id = var.zone_id
  name    = each.key
  content = each.value.content
  type    = "CNAME"
  ttl     = lookup(each.value, "ttl", 1) # Use 1 for auto
  proxied = lookup(each.value, "proxied", true)
  comment = lookup(each.value, "comment", "Managed by Terraform")
  tags    = lookup(each.value, "tags", var.default_tags)

}

# MX Records
resource "cloudflare_dns_record" "mx_records" {
  for_each = var.mx_records

  zone_id  = var.zone_id
  name     = lookup(each.value, "name", "@")
  content  = each.value.content
  type     = "MX"
  ttl      = lookup(each.value, "ttl", 1)
  priority = lookup(each.value, "priority", 10)
  comment  = lookup(each.value, "comment", "Managed by Terraform")
  tags     = lookup(each.value, "tags", var.default_tags)
}

# TXT Records
resource "cloudflare_dns_record" "txt_records" {
  for_each = var.txt_records

  zone_id = var.zone_id
  name    = each.key
  content = each.value.content
  type    = "TXT"
  ttl     = lookup(each.value, "ttl", 1)
  comment = lookup(each.value, "comment", "Managed by Terraform")
  tags    = lookup(each.value, "tags", var.default_tags)
}
# NS Records
resource "cloudflare_dns_record" "ns_records" {
  for_each = var.ns_records

  zone_id = var.zone_id
  name    = each.key
  content = each.value.content
  type    = "NS"
  ttl     = lookup(each.value, "ttl", 3600)
  comment = lookup(each.value, "comment", "Managed by Terraform")
  tags    = lookup(each.value, "tags", var.default_tags)
}
