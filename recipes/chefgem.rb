#
# Cookbook Name:: fog_gem
# Recipe:: chefgem
#
# Author:: Greg Hellings (<greg@thesub.net>)
# 
# 
# Copyright 2014, B7 Interactive, LLC
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

case node['platform_family']
when 'debian'
	include_recipe "apt"
when 'rhel'
	include_recipe "yum"
end
%w{
	gem_binary
	options
	version
}.each do |attrib|
	node.set['nokogiri'][attrib] = node['fog_gem'][attrib]
end

include_recipe "nokogiri::chefgem"

chef_gem "fog" do
	options node['fog_gem']['options']
	version node['nokogiri']['version']	
end
