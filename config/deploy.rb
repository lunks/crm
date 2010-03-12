# APP SETTINGS
# The ip address of your VPS
set :application, "crm"
set :domain_name , "crm.areacriacoes.com.br"

# GIT SETTINGS
set :scm, :git
set :repository,  "git@github.com:danielvlopes/crm.git"
set :branch, "aula20"
set :deploy_via, :remote_cache

# SSH SETTINGS
set :user , "creation"
set :deploy_to, "/home/creation/apps/#{application}"
set :shared_directory, "#{deploy_to}/shared"
set :use_sudo, false
set :group_writable, false
default_run_options[:pty] = true

# ROLES
role :app, domain_name
role :web, domain_name
role :db,  domain_name, :primary => true

#TASKS
namespace :deploy do
  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
