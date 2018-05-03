# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class CheckoutTest < Minitest::Test

  def CHK_R1_003
    assert_equal Checkout.new.checkout(""), 12    
  end

end
