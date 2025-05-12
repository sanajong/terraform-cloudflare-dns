# terraform-cloudflare-dns module

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
  source  = "git::https://github.com/sanajong/terraform-cloudflare-dns.git?ref=main"
  cloudflare_api_token = var.cloudflare_api_token
  zone_id              = var.zone_id
  dns_records          = var.dns_records
}
```

Example Variables
```hcl
variable "cloudflare_api_token" {}
variable "zone_id" {} # the cloudflare zone ID of the domain

variable "dns_records" {
  type = list(object({
    name    = string
    type    = string
    value   = string
    ttl     = number
    proxied = bool
  }))
}
```
Example DNS records

```hcl
dns_records = [
  {
    name    = "www"
    type    = "A"
    value   = "203.0.113.10"
    ttl     = 3600
    proxied = true
  },
  {
    name    = "api"
    type    = "CNAME"
    value   = "api.example.com"
    ttl     = 3600
    proxied = false
  }
]
```

## 📦 Requirements
- Terraform 1.0+
- Cloudflare API Token with permission to manage DNS for the specified zone

## 🔐 Security
Avoid hardcoding your credentials. Use environment variables, .tfvars, or secret managers to inject values securely.