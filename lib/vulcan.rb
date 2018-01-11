require "vulcan/version"
require "vulcan/json_reader"
require "vulcan/codable_generator"
require "json"
require "erb"

module Vulcan
  class Main
    def start
      json_path = ARGV[0]
      json = JsonReader.new.read_from_file(json_path)
      CodableGenerator.new.generate_codable_file(json)
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
