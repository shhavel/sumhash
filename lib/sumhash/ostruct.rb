module Sumhash::OpenStruct
  NUMBER_CLASSES = [Integer, Fixnum, Bignum, Float, Rational]
  SUPPORTED_CLASSES = NUMBER_CLASSES + [Hash, OpenStruct]

  def _fields
    @table.keys.map{|k| k.to_sym }
  end

  # Plus
  def +(os)
    (self._fields + os._fields).inject(OpenStruct.new()) do |sum, f|
      sum.send(:"#{f}=", sum(self.send(f), os.send(f)))
      sum
    end
  end

  # Minus
  def -(os)
    (self._fields + os._fields).inject(OpenStruct.new()) do |sum, f|
      sum.send(:"#{f}=", sum(self.send(f), os.send(f), :-))
      sum
    end
  end

  # Unary minus
  def -@
    self._fields.inject(OpenStruct.new()) do |res, f|
      v = self.send(f)
      res.send(:"#{f}=", SUPPORTED_CLASSES.include?(v.class) ? -v : v)
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
    self._fields.inject(OpenStruct.new()) do |res, f|
      v = self.send(f)
      res.send(:"#{f}=", SUPPORTED_CLASSES.include?(v.class) ? v/num.to_f : v)
      res
    end
  end

  # Multiplication
  def *(num)
    raise TypeError, "#{num.class} can't be coerced into Float"  unless NUMBER_CLASSES.include? num.class
    self._fields.inject(OpenStruct.new()) do |res, f|
      v = self.send(f)
      res.send(:"#{f}=", SUPPORTED_CLASSES.include?(v.class) && !v.kind_of?(String) ? v*num.to_f : v)
      res
    end
  end

  private
  # Can sum Objects if: 1) both numbers; 2) both Hashes; 3) both OpenStructs.
  def sum(n, m, sign=:+)
    if (NUMBER_CLASSES.include?(n.class) && NUMBER_CLASSES.include?(m.class)) || (n.class == Hash && m.class == Hash) || (n.class == OpenStruct && m.class == OpenStruct)
      n.send(sign, m)
    else
      n || m
    end
  end
end
