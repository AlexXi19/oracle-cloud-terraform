resource "oci_core_vcn" "Virtual-Cloud-Network-default" {
  cidr_block     = "192.168.0.0/16"
  compartment_id = var.tenancy_ocid
  is_ipv6enabled = true
}

resource "oci_core_internet_gateway" "Internet-Gateway-default" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.Virtual-Cloud-Network-default.id
}

resource "oci_core_default_route_table" "Route-Table-default" {
  compartment_id             = var.tenancy_ocid
  manage_default_resource_id = oci_core_vcn.Virtual-Cloud-Network-default.default_route_table_id
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.Internet-Gateway-default.id
  }
  route_rules {
    destination       = "::/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.Internet-Gateway-default.id
  }
}

resource "oci_core_default_security_list" "Security-List-default" {
  compartment_id             = var.tenancy_ocid
  manage_default_resource_id = oci_core_vcn.Virtual-Cloud-Network-default.default_security_list_id
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
  egress_security_rules {
    destination = "::/0"
    protocol    = "all"
  }
  ingress_security_rules {
    protocol = "all"
    source   = "0.0.0.0/0"
  }
  ingress_security_rules {
    protocol = "all"
    source   = "::/0"
  }
}

resource "oci_core_subnet" "Subnet-default" {
  cidr_block                 = cidrsubnet(oci_core_vcn.Virtual-Cloud-Network-default.cidr_block, 8, 0)
  compartment_id             = var.tenancy_ocid
  dhcp_options_id            = oci_core_vcn.Virtual-Cloud-Network-default.default_dhcp_options_id
  ipv6cidr_block             = cidrsubnet(oci_core_vcn.Virtual-Cloud-Network-default.ipv6cidr_blocks[0], 8, 0)
  prohibit_internet_ingress  = false
  prohibit_public_ip_on_vnic = false
  route_table_id             = oci_core_vcn.Virtual-Cloud-Network-default.default_route_table_id
  security_list_ids = [
    oci_core_vcn.Virtual-Cloud-Network-default.default_security_list_id,
  ]
  vcn_id = oci_core_vcn.Virtual-Cloud-Network-default.id
}

