require "ostruct"
require "#{File.expand_path('../')}/lib/sumhash.rb"
require "test/unit"

class TestDivision < Test::Unit::TestCase
  def test_division
    assert_equal( { n: 2.1, m: 3.2, os: OpenStruct.new(x: 1.1, y: 2.1), s: 'str' },
                  { n: 4.2, m: 6.4, os: OpenStruct.new(x: 2.2, y: 4.2), s: 'str' } / 2)
  end
end
