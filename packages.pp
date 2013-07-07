# This file is part of the workstation-puppet repo
# Purpose is to provide a place to grab a series of unrelated packages that
# do not need their own manifest

# TigerVNC used to access my Mac laptop for Omnifocus and get it off my desk
package { 'tigervnc':
	ensure	=> latest,
}
