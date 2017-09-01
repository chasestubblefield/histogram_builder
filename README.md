[![Build Status](https://travis-ci.org/chasetopher/histogram_builder.svg?branch=master)](https://travis-ci.org/chasetopher/histogram_builder)

# HistogramBuilder

Relevant to https://github.com/skyray-inc/interview-backend-histogram

## Usage

Requires `ruby` and `bundler`. Install dependencies with:

```bash
bundle install
```

Then run with:

```bash
./bin/histogram_builder test/example.json
step3: (30.0s) ##############################
step4: (15.0s) ###############
step1: (5.0s)  #####
step2: (1.0s)  #
```

## Discussion

First of all I want to point out that I don't believe the figure built here is a histogram, it is actually a bar graph. A histogram is for visualizing the distribution of a continuous variable, where the buckets are ranges of values and the height of the rectangles are the frequency of values occurring in those ranges. A histogram could be created, for example, to show the distribution of all the step times for a *particular* step. (This was part of the suggested enhancements.) Here we are creating just a bar graph, visually comparing a collection of numbers, (the median times of each step,) which are essentially unrelated.

As for creating figures for average and max execution times, the way I've structured the code makes this very easy to do. We would just change the argument to `BarGraph#new` from `analyzer.medians` to `analyzer.averages`. Making this a command-line option would be straightforward. Variability in runtime could be implemented this way as well, as its own bar graph where the values are calulcated by `ExecutionAnalyzer`.

For visualizing the distribution of times for particular steps (which would be a true histogram as discussed above), a new class `HistogramBuilder::Histogram` could be created that takes two arguments: a name, and an Array of values. It could determine the size of the buckets itself or be given them as an optional argument. The code to actually format the lines and do justification and calculating column widths could be extracted from the `BarGraph` class and encapsulated into its own function or class so as not be repeated.
