require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs = %w(lib test)
  t.pattern = 'test/**/test_*.rb'
end

task default: :test
