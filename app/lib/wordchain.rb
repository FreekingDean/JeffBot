require 'active_record'
require_relative '../models/entries'

# The class WordChain attempts to chain words together
# it is mostly like Markov
class WordChain
  class << self
    def next_word(previous_tokens)
      find_best_token(
        Entries.where(gram_2: previous_tokens[0], gram_1: previous_tokens[1])
          .order(count: :desc).pluck(:word, :count).to_h
      )
    end

    def bigram_word(previous_token)
      find_best_token(
        Entries.where(gram_1: previous_token)
        .order(count: :desc)
        .pluck(:word, :count).to_h
      )
    end

    private

    def find_best_token(tokens)
      return '' unless tokens.any?

      old_count = 0
      total_count = tokens.values.inject(:+)
      tokens = tokens.sort_by { |_, c| c } .reverse
      ap tokens
      tokens.each do |word, count|
        old_count += count
        return word if rand < (old_count / total_count)
      end

      tokens.keys.last
    end
  end
end
