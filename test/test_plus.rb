require "sumhash"
require "test/unit"

class TestPlus < Test::Unit::TestCase
  def test_hashes
    h1 = { n: 1.0, m: 2.3, s: 'beg' }
    h2 = { n: 3.2 }
    h3 = { m: 1.0, s: 'end' }

    sum = h1 + h2 + h3

    assert_equal({ n: 4.2, m: 3.3, s: "beg" }, sum)
  end

  def test_openstructs
    os1 = OpenStruct.new(n: 1.0, m: 2.3, s: 'beg')
    os2 = OpenStruct.new(n: 3.2)
    os3 = OpenStruct.new(m: 1.0, s: 'end')

    sum = os1 + os2 + os3

    assert_equal OpenStruct.new(n: 4.2, m: 3.3, s: "beg"), sum
  end

  def test_nested_hashes
    h1 = { n: 1.0, m: 2.3, h: { x: 1.0, y: 4.2 } }
    h2 = { n: 3.2 }
    h3 = { m: 1.0, h: { x: 1.2 } }

    sum = h1 + h2 + h3

    assert_equal({ n: 4.2, m: 3.3, h: { x: 2.2, y: 4.2 } }, sum)
  end

  def test_nested_openstructs
    h1 = { n: 1.0, m: 2.3, os: OpenStruct.new(x: 1.0, y: 4.2) }
    h2 = { n: 3.2 }
    h3 = { m: 1.0, os: OpenStruct.new(x: 1.2) }

    sum = h1 + h2 + h3

    assert_equal({ n: 4.2, m: 3.3, os: OpenStruct.new(x: 2.2, y: 4.2) }, sum)
  end

  def test_unary_minus
    assert_equal( { n: -4.2, m: -3.3, os: OpenStruct.new(x: -2.2, y: 4.2), s: 'str' },
                 -{ n: 4.2, m: 3.3, os: OpenStruct.new(x: 2.2, y: -4.2), s: 'str' })
  end

  def test_division
    assert_equal( { n: 2.1, m: 3.2, os: OpenStruct.new(x: 1.1, y: 2.1), s: 'str' },
                  { n: 4.2, m: 6.4, os: OpenStruct.new(x: 2.2, y: 4.2), s: 'str' } / 2)
  end

  def test_multiplication
    assert_equal( { n: 4.2, m: 6.4, os: OpenStruct.new(x: 2.2, y: 4.2), s: 'str' },
                  { n: 2.1, m: 3.2, os: OpenStruct.new(x: 1.1, y: 2.1), s: 'str' } * 2)
  end
end
