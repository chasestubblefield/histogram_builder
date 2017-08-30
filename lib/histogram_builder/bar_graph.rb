module HistogramBuilder
  class BarGraph

    # takes an Array of Arrays of names and values
    # ex. [["foo", 5], ["bar", 20], ...]
    def initialize(names_and_values, options = {})
      @names_and_values = names_and_values
      @order = options[:order] == :asc ? :asc : :desc
      @scale = options[:scale].is_a?(Numeric) ? options[:scale] : 1
    end

    # generates the graph as a String, a visual comparison of the given numbers
    def generate
      order = @order == :asc ? 1 : -1
      sorted = @names_and_values.sort_by { |(_, value)| value * order }
      sorted.map! do |(name, value)|
        value_in_secs = (value/1000).to_i
        [name, value, value_in_secs]
      end
      name_column_length = sorted.map{|n| n.first.length }.max + 1
      value_column_length = sorted.map{|n| n.last.to_s.length }.max + 3
      sorted.reduce("") do |result, (name, value, value_in_secs)|
        name_column = "#{name}:".ljust(name_column_length)
        value_column = "(#{value_in_secs}s)".ljust(value_column_length)
        bar_column = "#" * (value * @scale).to_i
        result + [name_column, value_column, bar_column].join(" ") + "\n"
      end
    end
  end
end
