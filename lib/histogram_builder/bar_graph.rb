module HistogramBuilder
  class BarGraph

    # takes an Array of Arrays of names and values
    # ex. [["foo", 5], ["bar", 20], ...]
    def initialize(names_and_values)
      @names_and_values = names_and_values
    end

    # generates the graph as a String, a visual comparison of the given numbers
    def generate
      @names_and_values.reduce("") do |result, (name, value)|
        result + "#{name}: #{value}\n"
      end
    end
  end
end
