require 'json'

require 'histogram_builder/version'

module HistogramBuilder
  def self.run(path)
    data = JSON.parse(File.read(path), symbolize_names: true)
    puts data
  end
end
