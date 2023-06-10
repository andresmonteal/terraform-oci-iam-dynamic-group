// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

module "dynamic_groups" {
  source = "../"

  for_each = var.dynamic_groups

  tenancy_ocid  = var.tenancy_ocid
  compartment   = each.value["compartment"]
  name          = each.key
  description   = lookup(each.value, "description", "default description")
  freeform_tags = lookup(each.value, "freeform_tags", {})
  defined_tags  = lookup(each.value, "defined_tags", {})
  rule          = each.value["rule"]
}