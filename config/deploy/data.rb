require 'mongoid'

namespace :data do
  namespace :db do
    desc "Clone data from remote environment"
    task :download, roles: :db, only: { primary: true } do
      root = File.expand_path("../../", File.dirname(__FILE__))
      tarfile = "infinitely-#{DateTime.now.strftime("%Y%m%d%H%M")}.tar.gz"

      cmd = ["cd #{current_path}"]
      cmd << "bundle exec rake db:dump RAILS_ENV=production"
      cmd << "mkdir -p tmp/dbs"
      cmd << "cd tmp/"
      cmd << "tar -czvf #{File.join current_path, "tmp/dbs/#{tarfile}"} dump"

      run cmd.join(" && ")

      system "mkdir -p #{File.join(root, "tmp/dbs")}"
      get File.join(current_path, "tmp/dbs/#{tarfile}"), File.join(root, "tmp/dbs/#{tarfile}"), via: :scp

      system "tar -xzv -C #{File.join(root, "tmp")} -f #{File.join(root, "tmp/dbs/#{tarfile}")}"

      ENV["MONGOID_ENV"] = "development"
      Mongoid.load!(File.join(root, "config/mongoid.yml"))#["sessions"]["default"]
      db =  Mongoid.default_session.options[:database]

      system "mongorestore -d #{db} tmp/dump/#{application}"
    end
  end

  namespace :uploads do
    desc "Download uploaded file from /uploads"
    task :download, roles: :app do

    end
  end
end