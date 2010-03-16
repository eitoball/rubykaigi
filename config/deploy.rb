# -*- coding: utf-8 -*-
set :application, "rubykaigi"
set :repository,  "git://github.com/ruby-no-kai/rubykaigi.git"
set :branch, "production"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/#{application}/railsapp"
set :ssh_options, { :forward_agent => true }

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :git_shallow_clone, 1

set :use_sudo, false
set :runner, "rubykaigi"
ssh_options[:username] = application

set :deploy_server, "rubykaigi.org"
role :app, deploy_server
role :web, deploy_server
role :db,  deploy_server, :primary => true

set :rake, "/home/#{application}/gem.repos/bin/rake"

def setup_shared(dir, path)
  src = "#{shared_path}/#{dir}/#{path}"
  dest = "#{latest_release}/#{dir}/#{path}"
  run "! test -e #{dest} && ln -s #{src} #{dest}"
end

def setup_shared_config(path)
  setup_shared("config", path)
end

namespace :deploy do
  task :after_update_code do
    setup_shared_config("database.yml")
    setup_shared_config("config.yml")
    setup_shared("db", "production.sqlite3")
  end

  task :after_symlink do
    run "mkdir -p #{current_path}/public/tmp"
    setup_shared("public/tmp", "pamphlet-20090708.zip")
  end

  task :start, :roles => :app do
  end

  desc "Restart Passenger"
  task :restart do
    run "touch #{latest_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
  end

  namespace :web do
    desc "maintenance variable: REASON,UNTIL"
    task :disable, :roles => :web, :except => { :no_release => true } do
      require 'erb'
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }

      reason = ENV['REASON']
      deadline = ENV['UNTIL']

      template = File.read(File.join(File.dirname(__FILE__), 'templates', 'maintenance.html.erb'))
      result = ERB.new(template).result(binding)

      put result, "#{shared_path}/system/maintenance.html", :mode => 0644
    end
  end
end


Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'
