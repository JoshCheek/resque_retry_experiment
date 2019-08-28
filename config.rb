require 'resque'
require 'resque-retry'
require 'resque/failure/redis'
Resque::Failure::MultipleWithRetrySuppression.classes = [Resque::Failure::Redis]
Resque::Failure.backend = Resque::Failure::MultipleWithRetrySuppression
Resque.logger.formatter = Resque::VeryVerboseFormatter.new


class Failer
  extend Resque::Plugins::Retry

  @queue       = :fail_tests
  @retry_limit = 3
  @retry_delay = 5

  def self.perform(filename)
    count = File.read(filename).to_i
    if count.zero?
      File.write filename, "success"
    else
      count -= 1
      File.write filename, count.to_s
      raise "#{count} left"
    end
  end
end
