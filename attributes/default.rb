# frozen_string_literal: true

# http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/getting-started#getting-started

default['icinga2client']['version'] = value_for_platform(
  %w[centos redhat fedora amazon] => { 'default' => '2.8.0-1' },
  %w[debian ubuntu raspbian] => { 'default' => '2.8.0-1' },
  %w[windows] => { 'default' => '2.8.0' }
)

default['icinga2client']['enable_env_pki'] = false
default['icinga2client']['enable_env_custom_pki'] = false
default['icinga2client']['ignore_version'] = false
default['icinga2client']['cookbook'] = 'icinga2client'

default['icinga2client']['conf_dir'] = if node['platform'] == 'windows'
                                         'C:/ProgramData/icinga2/etc/icinga2'
                                       else
                                         '/etc/icinga2'
                                       end

default['icinga2client']['conf_d_dir'] = ::File.join(node['icinga2client']['conf_dir'], 'conf.d')
default['icinga2client']['pki_dir'] = ::File.join(node['icinga2client']['conf_dir'], 'pki')
default['icinga2client']['scripts_dir'] = ::File.join(node['icinga2client']['conf_dir'], 'scripts')
default['icinga2client']['zones_dir'] = ::File.join(node['icinga2client']['conf_dir'], 'zones.d')

# avoid conflicts
default['icinga2client']['disable_conf_d'] = true
default['icinga2client']['disable_repository_d'] = false

# itl defaults
default['icinga2client']['include_itl'] = if node['platform'] == 'windows'
                                            %w[itl plugins-windows]
                                          else
                                            %w[itl plugins]
                                          end

# includes yum-epel cookbook to setup yum epel repository
default['icinga2client']['setup_epel'] = true

# object conf file location
default['icinga2client']['objects_d'] = 'objects.d'
default['icinga2client']['objects_dir'] = ::File.join(node['icinga2client']['conf_dir'], node['icinga2client']['objects_d'])

# user defined icing2 object / configuration
default['icinga2client']['user_defined_objects_dir'] = %w[user_defined_objects]

default['icinga2client']['features_enabled_dir'] = ::File.join(node['icinga2client']['conf_dir'], 'features-enabled')
default['icinga2client']['features_available_dir'] = ::File.join(node['icinga2client']['conf_dir'], 'features-available')

default['icinga2client']['cluster_attribute'] = nil
default['icinga2client']['application_attribute'] = nil
default['icinga2client']['enable_cluster_hostgroup'] = true
default['icinga2client']['enable_application_hostgroup'] = true
default['icinga2client']['enable_role_hostgroup'] = false
default['icinga2client']['limit_region'] = true

# host attribute to use for Host Object
# attribute display_name in LWRP environment
default['icinga2client']['host_display_name_attr'] = 'hostname'
default['icinga2client']['use_fqdn_resolv'] = false
default['icinga2client']['failover_fqdn_address'] = true
default['icinga2client']['ignore_node_error'] = false
default['icinga2client']['ignore_resolv_error'] = true

# icinga2 resources data bag
default['icinga2client']['databag'] = 'icinga2client'

default['icinga2client']['var_dir'] = if node['platform'] == 'windows'
                                        'C:/ProgramData/icinga2/var'
                                      else
                                        '/var'
                                      end

# params
default['icinga2client']['run_dir'] = ::File.join(node['icinga2client']['var_dir'], 'run/icinga2')
default['icinga2client']['run_cmd_dir'] = ::File.join(node['icinga2client']['run_dir'], 'cmd')
default['icinga2client']['cache_dir'] = ::File.join(node['icinga2client']['var_dir'], 'cache/icinga2')
default['icinga2client']['spool_dir'] = ::File.join(node['icinga2client']['var_dir'], 'spool/icinga2')
default['icinga2client']['perfdata_dir'] = ::File.join(node['icinga2client']['var_dir'], 'spool/icinga2/perfdata')
default['icinga2client']['lib_dir'] = ::File.join(node['icinga2client']['var_dir'], 'lib/icinga2')
default['icinga2client']['log_dir'] = ::File.join(node['icinga2client']['var_dir'], 'log/icinga2')
default['icinga2client']['cache_dir'] = ::File.join(node['icinga2client']['var_dir'], 'cache/icinga2')
default['icinga2client']['service_name'] = 'icinga2'

case node['platform_family']
when 'fedora', 'rhel', 'amazon'
  default['icinga2client']['user'] = 'icinga'
  default['icinga2client']['group'] = 'icinga'
  default['icinga2client']['cmdgroup'] = 'icingacmd'
  default['icinga2client']['service_config_file'] = '/etc/sysconfig/icinga2'

  default['icinga2client']['plugins_dir'] = if node['kernel']['machine'] == 'x86_64'
                                              '/usr/lib64/nagios/plugins'
                                            else
                                              '/usr/lib/nagios/plugins'
                                            end

when 'debian'
  default['icinga2client']['user'] = 'nagios'
  default['icinga2client']['group'] = 'nagios'
  default['icinga2client']['cmdgroup'] = 'nagios'
  default['icinga2client']['service_config_file'] = '/etc/default/icinga2'
  default['icinga2client']['plugins_dir'] = '/usr/lib/nagios/plugins'
when 'windows'
  default['icinga2client']['user'] = 'NT AUTHORITY\\NETWORK SERVICE'
  default['icinga2client']['group'] = 'NT AUTHORITY\\NETWORK SERVICE'
  default['icinga2client']['cmdgroup'] = 'NT AUTHORITY\\NETWORK SERVICE'
  default['icinga2client']['plugins_dir'] = 'C:/Program Files/ICINGA2/sbin'
end

default['icinga2client']['custom_plugins_dir'] = if node['platform'] == 'windows'
                                                   'C:/Program Files/ICINGA2/share/icinga2/include/plugins-custom'
                                                 else
                                                   '/opt/icinga2_custom_plugins'
                                                 end

default['icinga2client']['admin_user'] = 'icingaadmin'
default['icinga2client']['endpoint_port'] = 5665

# ulimit
default['icinga2client']['limits']['memlock']    = 'unlimited'
default['icinga2client']['limits']['nofile']     = 48_000
default['icinga2client']['limits']['nproc']      = 'unlimited'

# version suffix
case node['platform']
when 'centos', 'redhat', 'fedora', 'amazon'
  default['icinga2client']['version_suffix'] = value_for_platform(
    %w[centos redhat] => { 'default' => ".el#{node['platform_version'].split('.')[0]}.icinga" },
    'fedora' => { 'default' => ".fc#{node['platform_version']}.icinga" },
    'amazon' => { 'default' => '.el6.icinga' }
  )
when 'ubuntu', 'debian', 'raspbian'
  default['icinga2client']['version_suffix'] = '.' + node['lsb']['codename'].to_s
end

# constants
default['icinga2client']['constants']['NodeName'] = node['fqdn']
default['icinga2client']['constants']['PluginDir'] = node['icinga2client']['plugins_dir']
default['icinga2client']['constants']['ManubulonPluginDir'] = node['icinga2client']['plugins_dir']
default['icinga2client']['constants']['TicketSalt'] = 'ed25aed394c4bf7d236b347bb67df466'

# objects
default['icinga2client']['server']['object']['global-templates'] = false
default['icinga2client']['server']['object']['host']['import'] = 'generic-host'
default['icinga2client']['server']['object']['host']['max_check_attempts'] = 3
default['icinga2client']['server']['object']['host']['check_period'] = nil
default['icinga2client']['server']['object']['host']['notification_period'] = nil
default['icinga2client']['server']['object']['host']['check_interval'] = '1m'
default['icinga2client']['server']['object']['host']['retry_interval'] = '30s'
default['icinga2client']['server']['object']['host']['enable_notifications'] = true
default['icinga2client']['server']['object']['host']['enable_active_checks'] = true
default['icinga2client']['server']['object']['host']['enable_passive_checks'] = false
default['icinga2client']['server']['object']['host']['enable_event_handler'] = true
default['icinga2client']['server']['object']['host']['enable_flapping'] = true
default['icinga2client']['server']['object']['host']['enable_perfdata'] = true
default['icinga2client']['server']['object']['host']['event_command'] = nil
default['icinga2client']['server']['object']['host']['flapping_threshold'] = nil
default['icinga2client']['server']['object']['host']['volatile'] = nil
default['icinga2client']['server']['object']['host']['check_command'] = 'hostalive'
default['icinga2client']['server']['object']['host']['zone'] = nil
default['icinga2client']['server']['object']['host']['command_endpoint'] = nil
