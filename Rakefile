require 'rake'
require 'rspec/core/rake_task'
require "ruby-plsql"
require "yaml"

def init_connection(name = 'default')
  database_config_file = File.expand_path('./spec/database.yml')
  database_config = YAML.load(File.read(database_config_file))
  database_config = {} unless database_config.is_a?(Hash)

  symbol_params = Hash[*database_config[name].map{ |k, v| [k.to_sym, v] }.flatten]
  plsql.connect! symbol_params
  plsql.connection.autocommit = false
  plsql.execute "ALTER SESSION SET PLSQL_OPTIMIZE_LEVEL=1"
end

def close_connection
  plsql.logoff
end

load 'setup.rb'

task :deploy do
  include Setup

  init_connection

  deploy_file "deploy.list"

  close_connection
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task :default => [:deploy, :spec]
