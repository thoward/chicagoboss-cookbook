#
# Cookbook Name:: chicagoboss
# Recipe:: default
#
# Copyright 2013, Troy Howard
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

user node['chicagoboss']['user'] do
  comment "Chicago Boss"
  gid node['chicagoboss']['group']
  home node['chicagoboss']['dir']
  shell node['chicagoboss']['shell']
  system true
end

directory node['chicagoboss']['dir'] do
  owner node['chicagoboss']['user']
  group node['chicagoboss']['group']
  mode 00744
  action :create
end

git node['chicagoboss']['dir'] do
  repository node['chicagoboss']['repo']
  reference node['chicagoboss']['branch']
  user node['chicagoboss']['user']
  group node['chicagoboss']['group']
  action :checkout
end

bash "build_chicagoboss" do
   cwd node['chicagoboss']['dir']
   user node['chicagoboss']['user']
   group node['chicagoboss']['group']
   code 'make'
end
