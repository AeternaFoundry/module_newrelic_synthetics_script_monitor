resource "newrelic_synthetics_script_monitor" "synthetics_script_monitors" {
  for_each = var.synthetics_script_monitors

  name                                    = each.value.name
  period                                  = each.value.period
  status                                  = each.value.status
  type                                    = each.value.type
  account_id                              = each.value.account_id
  browsers                                = each.value.browsers
  device_orientation                      = each.value.device_orientation
  device_type                             = each.value.device_type
  devices                                 = each.value.devices
  enable_screenshot_on_failure_and_script = each.value.enable_screenshot_on_failure_and_script
  locations_public                        = each.value.locations_public
  runtime_type                            = each.value.runtime_type
  runtime_type_version                    = each.value.runtime_type_version
  script                                  = each.value.script
  script_language                         = each.value.script_language
  use_unsupported_legacy_runtime          = each.value.use_unsupported_legacy_runtime

  dynamic "location_private" {
    for_each = each.value.location_private != null ? each.value.location_private : []
    content {
      guid         = location_private.value.guid
      vse_password = location_private.value.vse_password
    }
  }

  dynamic "tag" {
    for_each = each.value.tag != null ? each.value.tag : []
    content {
      key    = tag.value.key
      values = tag.value.values
    }
  }
}

