# http://tutorials.jumpstartlab.com/topics/performance/background_jobs.html
require_relative 'config.rb'
require 'resque/tasks'
require 'resque/scheduler/tasks'

desc 'rake add FILENAME=some_filename COUNT=n'
task :add do
  filename = ENV.fetch 'FILENAME'
  count    = ENV.fetch 'COUNT'
  File.write filename, count
  Resque.enqueue(Failer, filename)
end
