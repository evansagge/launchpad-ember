require "bundler/capistrano"


load "config/deploy/base"
load "config/deploy/nginx"
load "config/deploy/unicorn"
load "config/deploy/uploads"
load "config/deploy/check"
load "config/deploy/data"
load "deploy/assets"

server "173.230.149.202", :web, :app, :db, primary: true

set :application, "launchpad"
set :domain, "evansagge.com"
set :user, "deploy"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, "git@github.com:evansagge/launchpad-ember.git"
set :branch, "master"

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :normalize_asset_timestamps, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:migrate"
after "deploy", "deploy:cleanup" # last 5 releases