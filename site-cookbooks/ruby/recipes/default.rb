#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user = node['user']['name']
home = node['user']['home']

node.ruby.versions.each do |version|
  cmd = %{rbenv install #{version}}
  execute "ruby-build" do
    command cmd
    user user
    action :run
    environment ({
      'CFLAGS' => '-Wno-error=shorten-64-to-32',
      'CONFIGURE_OPTS' => '--with-openssl-dir=/usr/local/opt/openssl --with-readline-dir=/usr/local/opt/readline'
    })
    not_if do
      IO.popen('rbenv versions').entries.select { |entry|
        entry =~ /#{version}/
      }.size == 1
    end
  end
end

execute ".bashrc" do
  command "echo 'eval \"$(rbenv init -)\"' >> #{home}/.bashrc; source #{home}/.bashrc"
  user user
  not_if "grep 'rbenv init' #{home}/.bashrc"
end
