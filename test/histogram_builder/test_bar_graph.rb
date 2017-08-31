require 'helper'

module HistogramBuilder
  class TestBarGraph < Minitest::Test
    def test_generate_simple
      names_and_time_ms = [
        ["foo", 1000],
        ["foobar", 2000],
      ]
      graph = BarGraph.new(names_and_time_ms, scale: 1000)
      expected = <<-DOC
foobar: (2.0s) ##
foo:    (1.0s) #
DOC
      assert_equal expected, graph.generate
    end
  end
end
