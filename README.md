icinga2client Cookbook
================

[![Cookbook](https://img.shields.io/github/tag/Icinga/chef-icinga2client.svg)](https://github.com/Icinga/chef-icinga2client) [![Build Status](https://travis-ci.org/Icinga/chef-icinga2client.svg?branch=master)](https://travis-ci.org/Icinga/chef-icinga2client)

![Icinga Logo](https://www.icinga.com/wp-content/uploads/2014/06/icinga_logo.png)

This is a [Chef] cookbook to manage [Icinga2] Client.


>> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/icinga2client).


## Most Recent Release

```ruby
cookbook 'icinga2client', '~> 1.0.0'
```


## From Git

```ruby
cookbook 'icinga2client', github: 'Icinga/chef-icinga2client',  tag: 'v1.0.0'
```


## Repository

```
https://github.com/Icinga/icinga2client
```


## Supported OS

- Amazon Linux
- CentOS
- Ubuntu
- Debian


## Supported Chef

- Chef 12
- Chef 13


## Cookbook Dependency

- icinga2repo


## Recipes

- `icinga2client::install` - install icinga2 client

- `icinga2client::config` - configure icinga2 client

- `icinga2client::service` - configure icinga2 service

- `icinga2client::default` - run_list recipe


## Cookbook Attributes

* `default['icinga2client']['version']` (default: `2.8.0-X, calculated`): icinga2 package version

* `default['icinga2client']['ignore_version']` (default: `false`): ignore icinga2 package version

* `default['icinga2client']['cookbook']` (default: `icinga2client`): icinga2client resources cookbook name

* `default['icinga2client']['disable_conf_d']` (default: `true`): disable icinga2 `conf.d` default configuration directory in `icinga2.conf` and use LWRP to manage icinga2 objects / templates

* `default['icinga2client']['disable_repository_d']` (default: `false`): disable icinga2 `repository.d` directory in `icinga2.conf`

* `default['icinga2client']['include_itl']` (default: `itl, plugins`): `icinga2.conf` include `itl` array attribute

* `default['icinga2client']['conf_dir']` (default: `/etc/icinga2`): icinga2 configuration location

* `default['icinga2client']['conf_d_dir']` (default: `/etc/icinga2/conf.d`): icinga2 conf.d directory location

* `default['icinga2client']['pki_dir']` (default: `/etc/icinga2/pki`): icinga2 pki directory location

* `default['icinga2client']['scripts_dir']` (default: `/etc/icinga2/scripts`): icinga2 script directory location

* `default['icinga2client']['zones_dir']` (default: `/etc/icinga2/zones.d`): icinga2 zones.d directory location

* `default['icinga2client']['objects_d']` (default: `objects.d`): cookbook created icinga2 Object/Templates resources directory name

* `default['icinga2client']['objects_dir']` (default: `/etc/icinga2/objects.d`): cookbook created icinga2 Object/Templates resources directory location

* `default['icinga2client']['user_defined_objects_dir']` (default: `['user_defined_objects']`): user defined configuration directories, each directory is included in `icinga2.conf` file.

* `default['icinga2client']['features_enabled_dir']` (default: `/etc/icinga2/features-enabled`): icinga2 enabled features location

* `default['icinga2client']['features_available_dir']` (default: `/etc/icinga2/features-available`): icinga2 available features location

* `default['icinga2client']['databag']` (default: `icinga2`): icinga2 databag name, currently not used

* `default['icinga2client']['var_dir']` (default: `calculated`): icinga2 run directory

* `default['icinga2client']['run_dir']` (default: `/var/run/icinga2`): icinga2 run directory

* `default['icinga2client']['run_cmd_dir']` (default: `/var/run/icinga2/cmd`): icinga2 location for process `icinga2.cmd`

* `default['icinga2client']['cache_dir']` (default: `/var/cache/icinga2`): icinga2 cache directory location

* `default['icinga2client']['spool_dir']` (default: `/var/spool/icinga2`): icinga2 spool directory location

* `default['icinga2client']['perfdata_dir']` (default: `/var/spool/icinga2/perfdata`): icinga2 perfdata directory location

* `default['icinga2client']['lib_dir']` (default: `/var/lib/icinga2`): icinga2 lib directory location

* `default['icinga2client']['log_dir']` (default: `/var/log/icinga2`): icinga2 core process log directory location

* `default['icinga2client']['cache_dir']` (default: `/var/cache/icinga2`): icinga2 cache directory location

* `default['icinga2client']['service_name']` (default: `icinga2`): icinga2 process name

* `default['icinga2client']['service_config_file']` (default: `/etc/default/icinga2`): icinga2 * process configuration file

* `default['icinga2client']['plugins_dir']` (default: `/usr/lib/nagios/plugins`): icinga2 plugins directory location

* `default['icinga2client']['custom_plugins_dir']` (default: `/opt/icinga2_custom_plugins`): icinga2 custom plugins directory

* `default['icinga2client']['admin_user']` (default: `icingaadmin`): icinga2 admin user

* `default['icinga2client']['user']` (default: `icinga`): icinga2 user

* `default['icinga2client']['group']` (default: `icinga`): icinga2 user group

* `default['icinga2client']['cmdgroup']` (default: `icingacmd`): icinga2 cmd user group

* `default['icinga2client']['endpoint_port']` (default: `5665`): icinga2 endpoint port

* `default['icinga2client']['version_suffix']` (default: `calculated`): icinga2 package suffix


## Cookbook Icinga2 Constants Attributes

* `default['icinga2client']['constants']['NodeName']` (default: `node['fqdn']`): icinga2 NodeName constant

* `default['icinga2client']['constants']['PluginDir']` (default: `node['icinga2']['plugins_dir']`): icinga2 plugins directory location

* `default['icinga2client']['constants']['ManubulonPluginDir']` (default: `node['icinga2']['plugins_dir']`): icinga2 plugins directory location

* `default['icinga2client']['constants']['TicketSalt']` (default: `ed25aed394c4bf7d236b347bb67df466`): icinga2 default TicketSalt key


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake & rake knife`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[Icinga2]: https://www.icinga.com/
[Contributors]: https://github.com/Icinga/chef-icinga2client/graphs/contributors
