name 'icinga2client'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache-2.0'
description 'Installs/Configures Icinga2 Client'
long_description 'Installs/Configures Icinga2 Client'
version '1.0.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/Icinga/chef-icinga2client/issues' if respond_to?(:issues_url)
source_url 'https://github.com/Icinga/chef-icinga2client' if respond_to?(:source_url)

depends 'icinga2repo', '>= 1.0.0'

%w[fedora redhat centos amazon ubuntu debian raspbian].each do |os|
  supports os
end
