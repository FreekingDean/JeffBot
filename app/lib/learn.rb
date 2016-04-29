require 'active_record'
require_relative '../models/entries'

# Learn remembers old inputs
class Learn
  class << self
    def train_array(inputs)
      inputs.each do |input|
        train(input)
      end
    end

    def train(input)
      learn_data = Entries.find_or_initialize_by(
        word: input[0], nword: input[1], definition: input[2]
      )
      learn_data.count = learn_data.count + 1
      learn_data.save
    end
  end
end
