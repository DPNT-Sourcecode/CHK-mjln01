# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class HelloTest < Minitest::Test

  def test_hello
    assert_match /John/, Hello.new.hello('John')
  end

end
