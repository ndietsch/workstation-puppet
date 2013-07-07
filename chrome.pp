yumrepo { 'google-chrome-x64':
  descr          => 'Google Chrome Linux X64 Repo',
  enabled        => '1',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
  baseurl	 => 'http://dl.google.com/linux/chrome/rpm/stable/x86_64',
}

package { 'google-chrome-stable':
	ensure	=> latest,
	require	=> Yumrepo['google-chrome-x64'],
}
