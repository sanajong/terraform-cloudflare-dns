# terraform-cloudflare-dns

A reusable [Terraform](https://www.terraform.io) module to manage **Cloudflare DNS records** using the official Cloudflare provider.

---

## 🔧 Features

- Supports multiple DNS record types (`A`, `AAAA`, `CNAME`, `TXT`, etc.)
- Easily reusable for different domains and zones
- Compatible with multiple environments (via `tfvars`)
- Built-in support for proxied or non-proxied records

---

## 📦 Usage

Include the module in your Terraform configuration:

```hcl
module "cloudflare_dns" {
  source  = "git::https://github.com/San-A-Jong/terraform-cloudflare-dns.git?ref=main"

  cloudflare_email     = var.cloudflare_email
  cloudflare_api_token = var.cloudflare_api_token
  zone_id              = var.zone_id
  dns_records          = var.dns_records
}
