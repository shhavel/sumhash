require "sumhash"
require "test/unit"

class TestUnaryMinus < Test::Unit::TestCase
  def test_unary_minus
    assert_equal( { n: -4.2, m: -3.3, os: OpenStruct.new(x: -2.2, y: 4.2), s: 'str' },
                 -{ n: 4.2, m: 3.3, os: OpenStruct.new(x: 2.2, y: -4.2), s: 'str' })
  end
end
