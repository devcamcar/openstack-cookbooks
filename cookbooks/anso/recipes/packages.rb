#
# Cookbook Name:: anso
# Recipe:: packages
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

include_recipe 'apt'

apt_repository "anso" do
  key "460DF9BE"
  keyserver "pgp.mit.edu"
  uri "http://packages.ansolabs.com/"
  distribution node[:apt][:distro]
  components(["main"])
  action :add
end
