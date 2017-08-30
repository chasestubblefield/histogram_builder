require 'test_helper'

class BarGraphTest < Minitest::Test
  def test_it_generates_simple_histograms
    names_and_values = [
      ["foo", 1000],
      ["foobar", 2000],
    ]
    graph = ::HistogramBuilder::BarGraph.new(names_and_values, scale: 0.001)
    expected = <<-DOC
foobar: (2s) ##
foo:    (1s) #
DOC
    assert_equal expected, graph.generate
  end
end
