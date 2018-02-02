module Vulcano
  class ParsedVariable
    attr_reader :original_name
    attr_reader :value
    attr_reader :type

    def initialize(key, value, type = nil)
      @original_name = key
      @value = value
      @type = type
    end

    def name
      original_name.camel_case_lower
    end

    def array
      ParsedVariable.new(original_name, nil, "[#{type}]")
    end

    def type
      return @type unless @type.nil?

      typeString(value)
    end

    def typeString(object)
      case object
      when Integer then 'Int'
      when Float then 'Float'
      when String then 'String'
      when TrueClass then 'Bool'
      when FalseClass then 'Bool'
      when Hash then original_name.camel_case
      when Array then "[#{typeString(object.first)}]"
      else
        raise "Unknown type: #{object.class}"
      end
    end
  end
end