# frozen_string_literal: true

#
# Cookbook Name:: icinga2client
# Recipe:: default
#
# Copyright 2014, Virender Khatri
#

include_recipe 'icinga2client::install'
include_recipe 'icinga2client::config'
include_recipe 'icinga2client::service'
