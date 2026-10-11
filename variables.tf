variable "synthetics_script_monitors" {
  description = <<EOT
Map of synthetics_script_monitors, attributes below
Required:
    - name
    - period
    - status
    - type
Optional:
    - account_id
    - browsers
    - device_orientation
    - device_type
    - devices
    - enable_screenshot_on_failure_and_script
    - locations_public
    - runtime_type
    - runtime_type_version
    - script
    - script_language
    - use_unsupported_legacy_runtime
    - location_private (block):
        - guid (required)
        - vse_password (optional)
    - tag (block):
        - key (required)
        - values (required)
EOT

  type = map(object({
    name                                    = string
    period                                  = string
    status                                  = string
    type                                    = string
    account_id                              = optional(number)
    browsers                                = optional(set(string))
    device_orientation                      = optional(string)
    device_type                             = optional(string)
    devices                                 = optional(set(string))
    enable_screenshot_on_failure_and_script = optional(bool)
    locations_public                        = optional(set(string))
    runtime_type                            = optional(string)
    runtime_type_version                    = optional(string)
    script                                  = optional(string)
    script_language                         = optional(string)
    use_unsupported_legacy_runtime          = optional(bool)
    location_private = optional(list(object({
      guid         = string
      vse_password = optional(string)
    })))
    tag = optional(list(object({
      key    = string
      values = list(string)
    })))
  }))
}

