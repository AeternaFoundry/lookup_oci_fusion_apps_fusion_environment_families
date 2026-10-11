data "oci_fusion_apps_fusion_environment_families" "fusion_apps_fusion_environment_families_lookup" {
  for_each = var.fusion_apps_fusion_environment_families_lookup

  compartment_id               = each.value.compartment_id
  display_name                 = each.value.display_name
  fusion_environment_family_id = each.value.fusion_environment_family_id
  state                        = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

