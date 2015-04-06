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

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
set :default_env, {
                    'PATH' => "/home/a06401/.rvm/gems/ruby-2.1.1/bin:/home/a06401/.rvm/gems/ruby-2.1.1@global/bin:/home/a06401/.rvm/rubies/ruby-2.1.1/bin:$PATH",
                    'RUBY_VERSION' => 'ruby 2.1.1p76',
                    'GEM_HOME' => '/home/a06401/.rvm/gems/ruby-2.1.1',
                    'GEM_PATH' => '/home/a06401/.rvm/gems/ruby-2.1.1:/home/a06401/.rvm/gems/ruby-2.1.1@global'
                }

# Default value for keep_releases is 5
# set :keep_releases, 3
#
# namespace :deploy do
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
#
# end
