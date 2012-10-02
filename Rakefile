require 'rubygems/package_task'

spec = eval(File.read('sumhash.gemspec'))

Gem::PackageTask.new(spec)

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test_*.rb']
end

task :default => :test
