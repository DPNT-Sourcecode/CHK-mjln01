# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class CheckoutTest < Minitest::Test

  def test_checkout
    assert_equal Checkout.new.checkout(""), 0
    assert_equal Checkout.new.checkout("A"), 50
    assert_equal Checkout.new.checkout("B"), 30
    

  end

end
