# Part of the workstation-puppet repo
# Used to install Vagrant

# Vagrant needs a yum repo, much better than installing directly
# Version 1.22 (latest as of 7/6/2013)

package { 'vagrant':
	provider	=> rpm,
	source	=> 'http://files.vagrantup.com/packages/7e400d00a3c5a0fdf2809c8b5001a035415a607b/vagrant_1.2.2_x86_64.rpm',
}

yumrepo { 'Fedora-VirtualBox':
	descr          => 'Fedora Virtual Box Repository',
	enabled        => '1',
	gpgcheck       => '1',
	gpgkey         => 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc',
	baseurl        => 'http://download.virtualbox.org/virtualbox/rpm/fedora/$releasever/$basearch',
}

package { 'VirtualBox-4.2':
	ensure	=> latest,
	require	=> Yumrepo['Fedora-VirtualBox'],
}

# Required for VirtualBox to compile the required kernel module
package { 'glibc-headers':
	ensure	=> latest,
}
package { 'glibc-devel':
	ensure	=> latest,
}
package { 'kernel-headers':
	ensure	=> latest,
}
package { 'kernel-devel':
	ensure => latest,
}
package { 'dkms':
	ensure	=> latest,
}
package { 'gcc':
	ensure	=> latest,
}

exec { 'virtualbox-driver-load':
	command	=> '/etc/init.d/vboxdrv setup',
	require	=> Package['VirtualBox-4.2'],
}
