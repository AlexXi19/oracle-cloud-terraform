data "oci_identity_availability_domain" "Availability-Domain-default" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}
