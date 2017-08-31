require 'helper'

module HistogramBuilder
  class TestBarGraph < Minitest::Test
    def test_generate_simple
      names_and_values = [
        ["foo", 1000],
        ["foobar", 2000],
      ]
      graph = BarGraph.new(names_and_values, scale: 0.001)
      expected = <<-DOC
foobar: (2s) ##
foo:    (1s) #
DOC
      assert_equal expected, graph.generate
    end
  end
end
