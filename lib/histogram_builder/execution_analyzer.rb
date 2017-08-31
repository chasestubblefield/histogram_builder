module HistogramBuilder
  class ExecutionAnalyzer

    def initialize(executions)
      @executions = executions
    end

    # collect times (in milliseconds) for each step into Hash of Arrays
    # ex: {"step1" => [5000, 5000, 5000], ...}
    def step_times
      @step_times ||= begin
        times = Hash.new { |h, k| h[k] = Array.new }
        @executions.each do |e|
          e[:steps].each do |s|
            name, time = s[:name], s[:timeMs]
            times[name].push time
          end
        end
        times.freeze
      end
    end

    # calculate median times (in milliseconds) for each step as Array of Arrays
    # ex: [["step1", 5000], ...]
    def medians
      @median_times ||= step_times.reduce([]) do |medians, (step, times)|
        medians.push [step, median(times)]
      end.freeze
    end

    # calculate average times (in milliseconds) for each step as Array of Arrays
    # ex: [["step1", 5000], ...]
    def averages
      @average_times ||= step_times.reduce([]) do |averages, (step, times)|
        averages.push [step, average(times)]
      end.freeze
    end

    private

    # calculate the median of a given Array of numbers
    def median(array)
      sorted = array.sort
      if array.length.odd? # if odd, return middlemost number
        sorted[array.length / 2].to_f
      else # if even, return mean of two middlemost numbers
        left_index = array.length / 2
        right_index = left_index + 1
        (sorted[left_index] + sorted[right_index]) / 2.0
      end
    end

    # calculate the average of a given Array of numbers
    def average(array)
      array.reduce(0.0) { |result, n| result + n }.to_f / array.size
    end

  end
end
