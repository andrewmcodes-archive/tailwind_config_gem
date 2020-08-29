require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "standard/rake"
require "reek/rake/task"
require "conventional_changelog"

Reek::Rake::Task.new

desc "Generate CHANGELOG"
task :changelog do
  ConventionalChangelog::Generator.new.generate!
end

desc "Run code quality checks"
task code_quality: %i[reek]

desc "Run linters"
task lint: %i[standard]

desc "Run formatters"
task format: ["standard:fix"]

desc "Measure code coverage"
task :coverage do
  original, ENV["COVERAGE"] = ENV["COVERAGE"], "true"
  Rake::Task["spec"].invoke
ensure
  ENV["COVERAGE"] = original
end

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = "spec/{,/*/**}/*_spec.rb"
end

namespace :spec do
  desc "Run unit specs"
  RSpec::Core::RakeTask.new(:unit) do |task|
    task.pattern = "spec/unit{,/*/**}/*_spec.rb"
  end

  desc "Run integration specs"
  RSpec::Core::RakeTask.new(:integration) do |task|
    task.pattern = "spec/integration{,/*/**}/*_spec.rb"
  end
end

task ci: %i[code_quality lint spec coverage]
task default: %i[code_quality format spec]
