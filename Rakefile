require 'rake/testtask'

Rake::TestTask.new do |t|
  # To run test for only one file (or file path pattern)
  #  $ bundle exec rake test TEST=test/test_specified_path.rb
  t.test_files = Dir["test/**/test_*.rb"]
  t.warning = false
end
