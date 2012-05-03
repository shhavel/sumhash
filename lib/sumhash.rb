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
end
