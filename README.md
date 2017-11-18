icinga2client Cookbook
================

[![Cookbook](https://img.shields.io/github/tag/Icinga/chef-icinga2client.svg)](https://github.com/Icinga/chef-icinga2client) [![Build Status](https://travis-ci.org/Icinga/chef-icinga2client.svg?branch=master)](https://travis-ci.org/Icinga/chef-icinga2client)

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


## Core Attributes
TODO


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
