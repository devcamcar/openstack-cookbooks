#
# Cookbook Name:: nova
# Recipe:: creds
#
# Copyright 2011, Anso Labs
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "unzip"

execute "nova-manage project zipfile #{node[:nova][:project]} #{node[:nova][:user]} /var/lib/nova/nova.zip" do
  user 'nova'
  not_if { File.exists?("/var/lib/nova/nova.zip") }
end

execute "unzip /var/lib/nova/nova.zip -d #{node[:nova][:creds][:dir]}/" do
  user node[:nova][:creds][:user]
  group node[:nova][:creds][:group]
  not_if { File.exists?("#{node[:nova][:creds][:dir]}/novarc") }
end
