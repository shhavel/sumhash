require "sumhash"
require "test/unit"

class TestMultiplication < Test::Unit::TestCase
  def test_multiplication
    assert_equal( { n: 4.2, m: 6.4, os: OpenStruct.new(x: 2.2, y: 4.2), s: 'str' },
                  { n: 2.1, m: 3.2, os: OpenStruct.new(x: 1.1, y: 2.1), s: 'str' } * 2)

    assert_raise(TypeError) { { n: 5, m: 7 } * "2" }
    assert_raise(TypeError) { OpenStruct.new({ n: 5, m: 7 }) * "2" }
  end
end
