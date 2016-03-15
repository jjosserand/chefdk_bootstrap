  windows_package 'Microsoft Visual Studio Code' do
    source node['chefdk_bootstrap']['vscode']['source_url']
    remote_file_attributes(
      path: File.join(Chef::Config[:file_cache_path], 'VSCodeSetup.exe')
    )
    installer_type :custom
    options '/silent'
  end
