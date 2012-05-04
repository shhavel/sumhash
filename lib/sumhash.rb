class Hash
  def +(hash)
    (self.keys + hash.keys).inject({}) do |sum, k|
      sum[k] = self[k] && hash[k] ? self[k] + hash[k] : self[k] || hash[k]
      sum
    end
  end

  def -(hash)
    (self.keys + hash.keys).inject({}) do |sum, k|
      sum[k] = self[k] && hash[k] ? self[k] - hash[k] : self[k] || hash[k]
      sum
    end
  end

  # Unary minus
  def -@
    self.inject({}) do |res, (k, v)|
      res[k] = v.respond_to?(:-@) ? -v : v
      res
    end
  end

  def /(num)
    raise TypeError, "#{num.class} can't be coerced into Float"  unless [Integer, Fixnum, Bignum, Float, Rational].include? num.class
    self.inject({}) do |res, (k, v)|
      res[k] = v.respond_to?(:/) ? v/num.to_f : v
      res
    end
  end

  def *(num)
    raise TypeError, "#{num.class} can't be coerced into Float"  unless [Integer, Fixnum, Bignum, Float, Rational].include? num.class
    self.inject({}) do |res, (k, v)|
      res[k] = v.respond_to?(:*) && !v.kind_of?(String) ? v*num.to_f : v
      res
    end
  end
end

class OpenStruct
  def _fields
    @table.keys.map{|k| k.to_sym }
  end

  def +(os)
    (self._fields + os._fields).inject(OpenStruct.new()) do |sum, f|
      sum.send(:"#{f}=", self.send(f) && os.send(f) ? self.send(f) + os.send(f) : self.send(f) || os.send(f))
      sum
    end
  end

  def -(os)
    (self._fields + os._fields).inject(OpenStruct.new()) do |sum, f|
      sum.send(:"#{f}=", self.send(f) && os.send(f) ? self.send(f) - os.send(f) : self.send(f) || os.send(f))
      sum
    end
  end

  # Unary minus
  def -@
    self._fields.inject(OpenStruct.new()) do |res, f|
      v = self.send(f)
      res.send(:"#{f}=", v.respond_to?(:-@) ? -v : v)
      res
    end
  end

  def /(num)
    raise TypeError, "#{num.class} can't be coerced into Float"  unless [Integer, Fixnum, Bignum, Float, Rational].include? num.class
    self._fields.inject(OpenStruct.new()) do |res, f|
      v = self.send(f)
      res.send(:"#{f}=", v.respond_to?(:/) ? v/num.to_f : v)
      res
    end
  end

  def *(num)
    raise TypeError, "#{num.class} can't be coerced into Float"  unless [Integer, Fixnum, Bignum, Float, Rational].include? num.class
    self._fields.inject(OpenStruct.new()) do |res, f|
      v = self.send(f)
      res.send(:"#{f}=", v.respond_to?(:*) && !v.kind_of?(String) ? v*num.to_f : v)
      res
    end
  end
end
