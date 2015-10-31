# encoding: utf-8

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
require 'rspec/core'
require 'rspec/core/rake_task'

NAME = ""

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = NAME
  gem.homepage = "http://github.com/alehander42/#{NAME}"
  gem.license = "MIT"
  gem.summary = %Q{}
  gem.description = %Q{}
  gem.email = "alehander42@gmail.com"
  gem.authors = ["Alexander Ivanov"]
  # dependencies defined in Gemfile
  gem.files.exclude 'tmp'
end
Jeweler::RubygemsDotOrgTasks.new

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end
task :default => :spec

