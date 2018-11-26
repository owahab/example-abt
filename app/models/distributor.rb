# frozen_string_literal: true

# Given a number of options, it does a weighted-round-robin between them
# using Fitness proportionate selection

class Distributor
  def initialize(*options)
    @options = options
  end

  def pick
    # Generate a random number between zero and the sum of all weights
    rnd = Random.new.rand(@options.map(&:weight).reduce(:+))

    total = 0
    new_total = 0
    choice = nil

    @options.each_with_index do |o, index|
      new_total = total + o.weight
      puts "Random: #{rnd}, old total: #{total}, new total: #{new_total}"
      # Skip comparison for first item
      # next if index.zero?
      # If the current total is less than
      if rnd <= new_total && rnd > total
        choice = o
        break
      end
      total = new_total
    end

    choice
  end
end
