require "vulcan/version"
require "vulcan/json_reader"
require "vulcan/codable_generator"
require "json"
require "erb"

module Vulcan
  class Main
    def start
      raise RuntimeError, 'The script has to be called with a JSON path' unless ARGV.length > 0

      json_path = ARGV[0]
      destination_folder = ARGV[1].nil? ? "." : ARGV[1]
      json = JsonReader.new.read_from_file(json_path)
      CodableGenerator.new.generate_codable_file(json, destination_folder)
    end
  end
end

class String
  def camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('_').map(&:capitalize).join
  end

  def camel_case_lower
    split('_').inject([]) do |buffer, e|
      buffer.push(buffer.empty? ? e : e.capitalize)
    end.join
  end
end
