require "vulcano/version"
require "vulcano/json_reader"
require "vulcano/codable_generator"
require "json"
require "erb"
require 'optparse'

module Vulcano
  class Main
    def start
      raise RuntimeError, 'The script has to be called with a JSON path' unless ARGV.length > 0

      options = parse_options()

      json_path = ARGV[0]
      destination_folder = options[:destination_folder].nil? ? "." : options[:destination_folder]
      json = JsonReader.new.read_from_file(json_path)
      CodableGenerator.new.generate_codable_file(json, destination_folder, options[:class_name])
    end

    def parse_options
      options = {}

      OptionParser.new do |opts|
        opts.banner = "Usage: vulcano json_path [options]"

        opts.on("-d", "--destination-folder DESTINATION_FOLDER", String, "Destination folder for the generated source") do |destination_folder|
          options[:destination_folder] = destination_folder
        end

        opts.on("-n", "--class-name CLASS_NAME", String, "Name for the generated class (the default name is 'Generated')") do |class_name|
          options[:class_name] = class_name
        end
      end.parse!

      return options
    end
  end
end

class String
  def camel_case_lower
    split('_').inject([]) do |buffer, e|
      buffer.push(buffer.empty? ? e : e.capitalize)
    end.join
  end

  def camel_case
    camel_case_lower_string = camel_case_lower
    letters = camel_case_lower.split('')
    letters.first.upcase!
    letters.join
  end  
end
