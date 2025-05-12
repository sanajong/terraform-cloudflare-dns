variable "zone_id" {
  description = "The Cloudflare Zone ID"
  type        = string
}

variable "default_tags" {
  description = "Default tags to apply to all DNS records"
  type        = list(string)
  default     = ["terraform-managed"]
}

variable "a_records" {
  description = "A map of A records to create"
  type = map(object({
    content = string
    ttl     = optional(number)
    proxied = optional(bool)
    comment = optional(string)
    tags    = optional(list(string))
    settings = optional(object({
      algorithm              = optional(string)
      answer_data            = optional(string)
      answer_ttl             = optional(number)
      ipv4_only              = optional(bool)
      ipv6_only              = optional(bool)
      orange_to_grey         = optional(bool)
      positive_record_weight = optional(number)
      run_stage              = optional(string)
      strike_record_weight   = optional(number)
      validate_answer        = optional(bool)
    }))
  }))
  default = {}
}

variable "cname_records" {
  description = "A map of CNAME records to create"
  type = map(object({
    content = string
    ttl     = optional(number)
    proxied = optional(bool)
    comment = optional(string)
    tags    = optional(list(string))
    settings = optional(object({
      algorithm              = optional(string)
      answer_data            = optional(string)
      answer_ttl             = optional(number)
      ipv4_only              = optional(bool)
      ipv6_only              = optional(bool)
      orange_to_grey         = optional(bool)
      positive_record_weight = optional(number)
      run_stage              = optional(string)
      strike_record_weight   = optional(number)
      validate_answer        = optional(bool)
    }))
  }))
  default = {}
}

variable "mx_records" {
  description = "A map of MX records to create"
  type = map(object({
    name     = optional(string)
    content  = string
    ttl      = optional(number)
    priority = optional(number)
    comment  = optional(string)
    tags     = optional(list(string))
  }))
  default = {}
}

variable "txt_records" {
  description = "A map of TXT records to create"
  type = map(object({
    content = string
    ttl     = optional(number)
    comment = optional(string)
    tags    = optional(list(string))
  }))
  default = {}
}
variable "ns_records" {
  description = "A map of NS records to create"
  type = map(object({
    content = string
    ttl     = optional(number)
    comment = optional(string)
    tags    = optional(list(string))
  }))
  default = {}
}

#variable "srv_records" {
#  description = "A map of SRV records to create"
#  type = map(object({
#    service  = string
#    proto    = string
#    name     = string
#    priority = optional(number)
#    weight   = optional(number)
#    port     = number
#    target   = string
#    ttl      = optional(number)
#    comment  = optional(string)
#    tags     = optional(list(string))
#  }))
#  default = {}
#}