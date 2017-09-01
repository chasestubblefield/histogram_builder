require 'helper'

class TestHistogramBuilder < Minitest::Test
  def test_that_it_has_a_version
    refute_nil ::HistogramBuilder::VERSION
  end

  def test_that_it_works_on_example
    sample = File.expand_path('../example.json', __FILE__)
    output, _ = capture_io { ::HistogramBuilder.run(sample) }
    expected = <<~EOF
      step3: (30.0s) ##############################
      step4: (15.0s) ###############
      step1: (5.0s)  #####
      step2: (1.0s)  #
    EOF
    assert_equal expected, output
  end
end
