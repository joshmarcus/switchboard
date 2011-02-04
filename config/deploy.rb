set :application, "Switchboard"
set :repository,  "git@github.com:switchboard/switchboard.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :branch, "deploy"

role :web, "69.164.216.141"                          # Your HTTP server, Apache/etc
role :app, "69.164.216.141"                          # This may be the same as your `Web` server
role :db,  "69.164.216.141", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "switchboard"

set :deploy_to, "/home/switchboard/production"
set :use_sudo, false 

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     #run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
     run "touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end
