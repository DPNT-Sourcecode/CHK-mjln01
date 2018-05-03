# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class HelloTest < Minitest::Test

  def test_hello
    assert_match Hello.new.hello('John'), "Hello, World!"
  end

end
