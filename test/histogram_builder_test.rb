require 'test_helper'

class HistogramBuilderTest < Minitest::Test
  def test_that_it_has_a_version
    refute_nil ::HistogramBuilder::VERSION
  end

  def test_that_it_works_on_example
    sample = File.expand_path('../example.json', __FILE__)
    output, _ = capture_io { ::HistogramBuilder.run(sample) }
    expected = <<-DOC
step3: (30s) ##############################
step4: (15s) ###############
step1: (5s)  #####
step2: (1s)  #
DOC
    assert_equal expected, output
  end
end
