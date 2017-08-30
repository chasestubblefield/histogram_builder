require 'json'

require 'histogram_builder/execution_analyzer'
require 'histogram_builder/version'

module HistogramBuilder
  def self.run(path)
    data = JSON.parse(File.read(path), symbolize_names: true)
    puts data
    analyzer = ExecutionAnalyzer.new(data[:executions].to_a)
    puts analyzer.step_times
  end
end
