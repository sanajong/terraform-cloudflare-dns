output "a_record_ids" {
  description = "IDs of created A records"
  value       = { for k, v in cloudflare_dns_record.a_records : k => v.id }
}
output "cname_record_ids" {
  description = "IDs of created CNAME records"
  value       = { for k, v in cloudflare_dns_record.cname_records : k => v.id }
}
output "mx_record_ids" {
  description = "IDs of created MX records"
  value       = { for k, v in cloudflare_dns_record.mx_records : k => v.id }
}
output "txt_record_ids" {
  description = "IDs of created TXT records"
  value       = { for k, v in cloudflare_dns_record.txt_records : k => v.id }
}
output "ns_record_ids" {
  description = "IDs of created NS records"
  value       = { for k, v in cloudflare_dns_record.ns_records : k => v.id }
}
