# Copyright 2015 Nordstrom, Inc.
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

default['chefdk_bootstrap']['atom']['source_url'] =
  value_for_platform_family(
    'mac_os_x' => 'https://atom.io/download/mac',
    'windows' => 'https://atom.io/download/windows'
  )
  
default ['chefdk_bootstrap']['vscode']['source_url'] =
  value_for_platform_family(
    'windows' => 'https://go.microsoft.com/fwlink/?LinkID=623230'  
  )


# common things to install
default['chefdk_bootstrap']['package'].tap do |install|
  install['atom'] = false
  install['vscode'] = true
  install['virtualbox'] = false
  install['vagrant'] = false
  install['git'] = true
  install['chefdk_julia'] = false
end

# windows specific
case node['platform_family']
when 'windows'
  default['chefdk_bootstrap']['package'].tap do |install|
    install['kdiff3'] = true
    install['gitextensions'] = true
  end
when 'mac_os_x'
  default['chefdk_bootstrap']['package'].tap do |install|
    install['iterm2'] = true
  end
end

# whether to mess with PowerShell settings
default['chefdk_bootstrap']['powershell']['configure'] = true

# Enable cmd line tools like git, curl, Stove to work through a proxy server.
# Override these to set http_proxy, https_proxy, and no_proxy env vars
default['chefdk_bootstrap']['proxy']['http'] = ENV['http_proxy'] # 'http://myproxy.example.com:1234'
# Skip the proxy for these domains and IPs. This should be a comma-separated string
default['chefdk_bootstrap']['proxy']['no_proxy'] = ENV['no_proxy'] # 'example.com,localhost,127.0.0.1'

default['chefdk_bootstrap']['virtualbox']['source'] = 'http://download.virtualbox.org/virtualbox/5.0.14/VirtualBox-5.0.14-105127-OSX.dmg'
default['chefdk_bootstrap']['virtualbox']['checksum'] = '4de41068712eb819749b5376c90dca47f9a1d6eecf4c516d83269ac12add2aa4'
