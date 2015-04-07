# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'sait-znakomstv'
set :repo_url, 'git@github.com:teacplusplus/sait-znakomstv.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/a06401/var/zs-1'

# Default value for :scm is :git
set :scm, :git


set :unicorn_pid, "/home/a06401/var/zs-1/run/unicorn.pid"


# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/unicorn.rb', 'config/config.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, {
#                     'PATH' => "/home/a06401/.rvm/gems/ruby-2.1.1/bin:/home/a06401/.rvm/gems/ruby-2.1.1@global/bin:/home/a06401/.rvm/rubies/ruby-2.1.1/bin:$PATH",
#                     'RUBY_VERSION' => 'ruby 2.1.1p76',
#                     'GEM_HOME' => '/home/a06401/.rvm/gems/ruby-2.1.1',
#                     'GEM_PATH' => '/home/a06401/.rvm/gems/ruby-2.1.1:/home/a06401/.rvm/gems/ruby-2.1.1@global'
#
# set :rvm_ruby_string, 'ruby 2.1.1p76' # you probably have this already
# set :rvm_type, :user # this is the money config, it defaults to :system
set :rails_env, "production"

namespace :deploy do



  desc 'Restart unicorn'
  task :restart do
    on roles(:all) do

      if test "[ -f #{fetch(:unicorn_pid)} ]"
        execute :kill, "-QUIT `cat #{fetch(:unicorn_pid)}` 2>/dev/null; true"
        execute :rm, fetch(:unicorn_pid)
      end
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, 'exec unicorn', "-c #{release_path}/config/unicorn.rb -D -E #{fetch(:rails_env)}"
        end
      end

    end
  end
end



# before 'deploy', 'deploy:compile_assets'
after 'deploy', 'deploy:restart'