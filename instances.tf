resource "oci_core_instance" "Instance-1" {
  availability_domain = data.oci_identity_availability_domain.Availability-Domain-default.name
  compartment_id      = var.tenancy_ocid
  shape               = "VM.Standard.A1.Flex"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.Subnet-default.id
  }
  metadata = {
    "ssh_authorized_keys" = var.ssh_authorized_keys
  }
  display_name = "Alex's Instance - A1"
  shape_config {
    memory_in_gbs = 24
    ocpus         = 4
  }
  source_details {
    boot_volume_size_in_gbs = 50
    source_id               = "ocid1.image.oc1.us-sanjose-1.aaaaaaaacdzh2e4tcrxowru2ygh62eiqp4iu2q2io3ippaqdtxks2ojtw5uq"
    source_type             = "image"
  }
  preserve_boot_volume = true
}

resource "oci_core_instance" "Instance-2" {
  availability_domain = data.oci_identity_availability_domain.Availability-Domain-default.name
  compartment_id      = var.tenancy_ocid
  shape               = "VM.Standard.E2.1.Micro"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.Subnet-default.id
  }
  display_name = "Alex's Instance - Micro"
  metadata = {
    "ssh_authorized_keys" = var.ssh_authorized_keys
  }
  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }
  source_details {
    boot_volume_size_in_gbs = 50
    source_id               = "ocid1.image.oc1.us-sanjose-1.aaaaaaaadq3dxjoqeckwgas733dxmrfsdconukiq357m6sjhb2xyhfpi4ica"
    source_type             = "image"
  }
  preserve_boot_volume = true
}

