terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  # Configuration options
  uri = "qemu:///system"
  #alias = "server2"
  #uri   = "qemu+ssh://root@192.168.100.10/system"
}

# module "rhel8-ansiblec" {
#   source = "./vms/rhel8-ansiblec.tf"
# }

# module "rhel8-mhost1" {
#   source = "./vms/rhel8-mhost1.tf"
# }

# module "rhel8-mhost2" {
#   source = "./vms/rhel8-mhost2.tf"
# }

# module "rhel8-mhost3" {
#   source = "./vms/rhel8-mhost3.tf"
# }

# module "rhel8-mhost4" {
#   source = "./vms/rhel8-mhost4.tf"
# }