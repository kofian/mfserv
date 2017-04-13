# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "money"
#set :repo_url, "git@github.com:kofian/finca.git"
set :repo_url, "git://github.com/kofian/finca.git"

set :linked_dirs, %w(
  bin log vendor/bundle public/system
  tmp/pids tmp/cache tmp/sockets
)
#set :puma_bind, "tcp://223.25.244.120:8080"
set :user,   'deployer'
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :rbenv_ruby, '2.4.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

#Rake::Task["deploy:assets:precompile"].clear_actions
#Rake::Task["deploy:assets:backup_manifest"].clear_actions

set :passenger_restart_with_touch, true
#set :pty,             true
#set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache


namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

end


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
#set :branch, :master

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
#set :deploy_to, "/var/www/transa-transact.com/public_html/money"
set :deploy_to, "/var/www/transa-transact.com/public_html"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true
#set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
#set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
