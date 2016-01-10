module Sumhash::Hash
  NUMBER_CLASSES = [Integer, Fixnum, Bignum, Float, Rational]
  SUPPORTED_CLASSES = NUMBER_CLASSES + [Hash, OpenStruct]

  # Plus
  def +(hash)
    self.merge(hash) { |_, v1, v2| sum(v1, v2) }
  end

  # Minus
  def -(hash)
    self.merge(hash) { |_, v1, v2| sum(v1, v2, :-) }
  end

  # Unary minus
  def -@
    self.inject({}) do |res, (k, v)|
      res[k] = SUPPORTED_CLASSES.include?(v.class) ? -v : v
      res
    end
  end

  # Unary plus
  def +@
    self
  end

  # Division
  def /(num)
    raise TypeError, "#{num.class} can't be coerced into Float"  unless NUMBER_CLASSES.include? num.class
    self.inject({}) do |res, (k, v)|
      res[k] = SUPPORTED_CLASSES.include?(v.class) ? v / num : v
      res
    end
  end

  # Multiplication
  def *(num)
    raise TypeError, "#{num.class} can't be coerced into Float"  unless NUMBER_CLASSES.include? num.class
    self.inject({}) do |res, (k, v)|
      res[k] = SUPPORTED_CLASSES.include?(v.class) ? v * num : v
      res
    end
  end

private
  # Can sum Objects if: 1) both numbers; 2) both Hashes; 3) both OpenStructs.
  def sum(n, m, sign=:+)
    if (NUMBER_CLASSES.include?(n.class) && NUMBER_CLASSES.include?(m.class)) || (n.is_a?(Hash) && m.is_a?(Hash)) || (n.is_a?(OpenStruct) && m.is_a?(OpenStruct))
      n.__send__(sign, m)
    else
      n || m
    end
  end
end
