# Defining VM Volume
resource "libvirt_volume" "rhel8-mhost3-qcow2" {
  name = "rhel8-mhost3.qcow2"
  pool = "default" # List storage pools using virsh pool-list
  #source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  source = "./rhel-8.8-x86_64-kvm.qcow2"
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "rhel8-mhost3" {
  name   = "mhost3"
  memory = "2048"
  vcpu   = 2

  network_interface {
    network_id     = libvirt_network.ansiblelab_network.id
    hostname       = "mhost3"
    addresses      = ["192.168.99.30"]
    # mac            = "AA:BB:CC:11:22:22"
    wait_for_lease = false
  }

  disk {
    volume_id = "${libvirt_volume.rhel8-mhost3-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

# Output Server IP
# output "ip" {
#   value = "${libvirt_domain.rhel8.network_interface.0.addresses.0}"
# }