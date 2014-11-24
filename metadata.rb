name             'fog_gem'
maintainer       'Greg Hellings'
maintainer_email 'greg@thesub.net'
license          'Apache V2'
description      'Installs/Configures fog_gem'
long_description 'Installs/Configures fog_gem'
version          '0.1.1'

depends          'nokogiri'
depends          'apt'
depends          'yum'

%w{ amazon redhat ubuntu centos}.each do |distro|
	supports distro
end

