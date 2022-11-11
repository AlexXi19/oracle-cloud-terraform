resource "oci_core_volume_attachment" "Volume-Attachment-1" {
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.Instance-1.id
  display_name    = "Instance 1 Block Volume Attachment"
  volume_id       = oci_core_volume.Block-Volume-1.id
}

resource "oci_core_volume" "Block-Volume-1" {
  availability_domain = data.oci_identity_availability_domain.Availability-Domain-default.name
  compartment_id      = var.tenancy_ocid
  display_name        = "Instance 1 Block Volume"
  size_in_gbs         = 50
}

resource "oci_core_volume_attachment" "Volume-Attachment-2" {
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.Instance-2.id
  display_name    = "Instance 1 Block Volume Attachment"
  volume_id       = oci_core_volume.Block-Volume-2.id
}

resource "oci_core_volume" "Block-Volume-2" {
  availability_domain = data.oci_identity_availability_domain.Availability-Domain-default.name
  compartment_id      = var.tenancy_ocid
  display_name        = "Instance 2 Block Volume"
  size_in_gbs         = 50
}
