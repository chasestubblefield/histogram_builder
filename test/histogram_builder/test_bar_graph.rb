require 'helper'

module HistogramBuilder
  class TestBarGraph < Minitest::Test
    def test_generate_simple
      names_and_time_ms = [
        ["step1", 1],
        ["step2", 2],
      ]
      graph = BarGraph.new(names_and_time_ms)
      expected = <<-DOC
step2: (0.002s) ##
step1: (0.001s) #
DOC
      assert_equal expected, graph.generate
    end

    def test_generate_with_scale
      names_and_time_ms = [
        ["step1", 1000],
        ["step2", 2000],
      ]
      graph = BarGraph.new(names_and_time_ms, scale: 1000)
      expected = <<-DOC
step2: (2.0s) ##
step1: (1.0s) #
DOC
      assert_equal expected, graph.generate
    end

    def test_generate_does_justification
      names_and_time_ms = [
        ["foo", 10],
        ["foobar", 100],
      ]
      graph = BarGraph.new(names_and_time_ms, scale: 10)
      expected = <<-DOC
foobar: (0.1s)  ##########
   foo: (0.01s) #
DOC
      assert_equal expected, graph.generate
    end
  end
end
