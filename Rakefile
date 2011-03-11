require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "better_nested_set"
  gem.homepage = "http://github.com/railsbros-dirk/better_nested_set"
  gem.license = "MIT"
  gem.summary = %Q{This plugin provides an ehanced acts_as_nested_set mixin for ActiveRecord}
  gem.description = %Q{This plugin provides an enhanced acts_as_nested_set mixin for ActiveRecord, the object-relational mapping layer of the framework Ruby on Rails. The original nested set in Rails lacks many important features, such as moving branches within a tree.}
  gem.email = "dirk.breuer@gmail.com"
  gem.authors = ["Chris Bailey", "Jean-Christophe Michel", "Dirk Breuer"]
  gem.files += FileList['lib/**/*.rb', 'app/**/*.rb'].to_a
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
desc 'Run tests on all database adapters. See README.'
task :default => [:test_mysql, :test_sqlite3, :test_postgresql]

%w(mysql postgresql sqlite3).each do |adapter|
  Rake::TestTask.new("test_#{adapter}") { |t|
    t.libs << 'lib'
    t.pattern = "test/#{adapter}.rb"
    t.verbose = true
  }
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "better_nested_set #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
