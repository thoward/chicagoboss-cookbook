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

user "chicagoboss" do
  comment "Chicago Boss"
  home "/var/chicagoboss"
  shell "/bin/bash"
  system true
end

directory "/var/chicagoboss" do
  owner "chicagoboss"
  group "chicagoboss"
  mode 00744
  action :create
end

git "/var/chicagoboss" do
  repository "git://github.com/evanmiller/ChicagoBoss.git"
  reference "master"
  user "chicagoboss"
  group "chicagoboss"
  action :checkout
end

bash "build_chicagoboss" do
   cwd "/var/chicagoboss"
   user "chicagoboss"
   group "chicagoboss"
   code 'make'
end
