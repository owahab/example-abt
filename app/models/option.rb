# frozen_string_literal: true

# An option used in A/B testing
# The weight can be any integer but it's relatively easier
# to use option weights that sum up to a 100
class Option
  attr_accessor :name, :weight

  def initialize(name:, weight:)
    raise 'weight must be a positive number' if weight.nil? || weight <= 0
    raise 'name must not be empty' if name.nil? || name.empty?

    @name = name
    @weight = weight
  end
end
