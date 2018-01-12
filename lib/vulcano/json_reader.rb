module Vulcano
  class JsonReader
    def read_from_file(file_path)
      file = File.read(file_path)
      JSON.parse(file)
    end
  end
end