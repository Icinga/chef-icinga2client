# frozen_string_literal: true

#
# Cookbook Name:: icinga2client
# Recipe:: install
#
# Copyright 2017, Virender Khatri
#

if platform?('windows')
  chocolatey_package 'icinga2client' do
    version node['icinga2client']['version']
    action :upgrade
  end
else
  include_recipe 'icinga2repo::default'
end

package 'icinga2' do
  version node['icinga2client']['version'] + node['icinga2client']['version_suffix'] unless node['icinga2client']['ignore_version']
  notifies :restart, 'service[icinga2]', :delayed
end
