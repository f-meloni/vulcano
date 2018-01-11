module Vulcan
  class CodableKey
    attr_reader :original_name
    attr_reader :codable_name

    def initialize(original_name, codable_name = nil)
      @original_name = original_name
      @codable_name = codable_name
    end
  end
end