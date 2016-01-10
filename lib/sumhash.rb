require 'sumhash/version'
require 'sumhash/hash'
require 'sumhash/ostruct'
require 'ostruct'

class Hash
  include Sumhash::Hash
end

class OpenStruct
  include Sumhash::OpenStruct
end
