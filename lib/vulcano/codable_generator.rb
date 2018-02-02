require "vulcano/parsed_class"
require "vulcano/parsed_variable"

module Vulcano
  class CodableGenerator
    def generate_codable_file(json, destination_folder, options, className)
      if json.is_a?(Array)
        generate_codable_file(json.first, destination_folder, options, className)
        return
      end

      variables = []

      json.each do |key, value|
        parsed_object = parse_object(destination_folder, options, key, value)

        variables.push(parsed_object) unless parsed_object.nil?
      end

      name = className.nil? ? 'Generated' : className

      parsed_class = ParsedClass.new(name, variables, !(options[:public].nil?), options[:use_classes].nil?)

      spec = Gem::Specification.find_by_name('vulcano')
      template = File.read("#{spec.gem_dir}/resources/TemplateFile.swift")

      renderer = ERB.new(template)
      result = renderer.result(parsed_class.class_binding)

      File.open("#{destination_folder}/#{name}.swift", 'w') { |f| f.write(result) }
    end

    def parse_object(destination_folder, options, key, value)
      return nil if value.is_a?(Array) && value.size == 0
      return parse_object(destination_folder, options, key, value.first).array if value.is_a?(Array)
      return nil if value.nil?

      if value.is_a?(Hash)
        generate_codable_file(value, destination_folder, options, class_name_from_key(key))
      end

      ParsedVariable.new(key, value)
    end

    def class_name_from_key(key)
      key.camel_case
    end
  end
end