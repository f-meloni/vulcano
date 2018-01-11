require "vulcan/codable_key"

module Vulcan
  class ParsedClass
    attr_reader :name
    attr_reader :variables
    attr_reader :codable_keys

    def initialize(name, variables)
      @name = name
      @variables = variables
      @codable_keys = codable_keys
    end

    def class_binding
      binding
    end

    private

    def codable_keys
      codable_keys = []

      has_codable_keys = false

      variables.each do |variable|
        if variable.name == variable.original_name
          codable_keys.push(CodableKey.new(variable.original_name))
        else
          codable_keys.push(CodableKey.new(variable.original_name, variable.name))
          has_codable_keys = true
        end
      end

      return nil unless has_codable_keys

      codable_keys
    end
  end
end