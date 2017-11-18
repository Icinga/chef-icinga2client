# frozen_string_literal: true

#
# Cookbook Name:: icinga2config
# Recipe:: config
#
# Copyright 2014, Virender Khatri
#

[
  node['icinga2client']['conf_dir'],
  ::File.join(node['icinga2client']['conf_dir'], 'repository.d'),
  node['icinga2client']['conf_d_dir'],
  node['icinga2client']['pki_dir'],
  node['icinga2client']['scripts_dir'],
  node['icinga2client']['zones_dir'],
  node['icinga2client']['objects_dir'],
  node['icinga2client']['features_enabled_dir'],
  node['icinga2client']['features_available_dir'],
  node['icinga2client']['custom_plugins_dir']
].each do |d|
  directory d do
    owner node['icinga2client']['user']
    group node['icinga2client']['group']
    mode 0o750
  end
end

node['icinga2client']['user_defined_objects_dir'].each do |d|
  directory ::File.join(node['icinga2client']['conf_dir'], d) do
    owner node['icinga2client']['user']
    group node['icinga2client']['group']
    mode 0o750
  end
end

[
  node['icinga2client']['log_dir'],
  node['icinga2client']['run_dir'],
  ::File.join(node['icinga2client']['log_dir'], 'compat'),
  ::File.join(node['icinga2client']['log_dir'], 'compat', 'archives')
].each do |d|
  directory d do
    owner node['icinga2client']['user']
    group node['icinga2client']['cmdgroup']
    recursive true if platform?('windows')
    mode 0o750
  end
end

directory node['icinga2client']['cache_dir'] do
  owner node['icinga2client']['user']
  group node['icinga2client']['user']
  recursive true if platform?('windows')
  mode 0o750
end

unless platform?('windows')
  # icinga2 logrotate
  template '/etc/logrotate.d/icinga2' do
    source 'icinga2.logrotate.erb'
    owner 'root'
    group 'root'
    mode 0o644
    variables(:log_dir => node['icinga2client']['log_dir'], :user => node['icinga2client']['user'], :group => node['icinga2client']['group'])
  end
end

# icinga2.conf
template ::File.join(node['icinga2client']['conf_dir'], 'icinga2.conf') do
  source 'icinga2.conf.erb'
  owner node['icinga2client']['user']
  group node['icinga2client']['group']
  mode 0o640
  variables(
    :include_itl => node['icinga2client']['include_itl'],
    :disable_repository_d => node['icinga2client']['disable_repository_d'],
    :disable_conf_d => node['icinga2client']['disable_conf_d'],
    :objects_d => node['icinga2client']['objects_d'],
    :user_defined_objects_dir => node['icinga2client']['user_defined_objects_dir']
  )
  notifies platform?('windows') ? :restart : :reload, 'service[icinga2]', :delayed
end

unless platform?('windows')
  # icinga2 service config file
  template node['icinga2client']['service_config_file'] do
    source 'icinga2.service.config.erb'
    owner 'root'
    group 'root'
    mode 0o640
    variables(
      :log_dir => node['icinga2client']['log_dir'],
      :conf_dir => node['icinga2client']['conf_dir'],
      :user => node['icinga2client']['user'],
      :group => node['icinga2client']['group'],
      :cmdgroup => node['icinga2client']['cmdgroup']
    )
    notifies platform?('windows') ? :restart : :reload, 'service[icinga2]', :delayed
  end

  # icinga2 service init config file
  template ::File.join(node['icinga2client']['conf_dir'], 'init.conf') do
    source 'icinga2.init.conf.erb'
    owner node['icinga2client']['user']
    group node['icinga2client']['group']
    mode 0o640
    variables(
      :user => node['icinga2client']['user'],
      :group => node['icinga2client']['group']
    )
    notifies platform?('windows') ? :restart : :reload, 'service[icinga2]', :delayed
  end
end

# icinga2 constants config file
template ::File.join(node['icinga2client']['conf_dir'], 'constants.conf') do
  source 'icinga2.constants.conf.erb'
  owner node['icinga2client']['user']
  group node['icinga2client']['group']
  mode 0o640
  variables(
    :options => node['icinga2client']['constants']
  )
  notifies platform?('windows') ? :restart : :reload, 'service[icinga2]', :delayed
end
