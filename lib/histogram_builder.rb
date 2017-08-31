require 'json'

require 'histogram_builder/bar_graph'
require 'histogram_builder/execution_analyzer'
require 'histogram_builder/version'

module HistogramBuilder
  def self.run(path)
    data = JSON.parse(File.read(path), symbolize_names: true)
    analyzer = ExecutionAnalyzer.new(data[:executions].to_a)
    graph = BarGraph.new(analyzer.medians, scale: 1000)
    puts graph.generate
  end
end
