# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class CheckoutTest < Minitest::Test

  def test_checkout
    assert_equal Checkout.new.checkout(""), 0
    assert_equal Checkout.new.checkout("A"), 50
    assert_equal Checkout.new.checkout("B"), 30
    assert_equal Checkout.new.checkout("C"), 20
    assert_equal Checkout.new.checkout("D"), 15

    assert_equal Checkout.new.checkout("E"), -1
    assert_equal Checkout.new.checkout("-"), -1
    assert_equal Checkout.new.checkout("ABCa"), -1
    assert_equal Checkout.new.checkout("AxA"), -1
    assert_equal Checkout.new.checkout("ABCD"), 115

    assert_equal Checkout.new.checkout("AA"), 100
    assert_equal Checkout.new.checkout("AAA"), 130
    assert_equal Checkout.new.checkout("AAAA"), 180



  end

end
