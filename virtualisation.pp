# Part of the workstation-puppet repo
# Install KVM and other packages

package { 'virt-manager':
	ensure	=> latest,
}

package { 'libvirt-daemon-config-network':
	ensure	=> latest,
}
