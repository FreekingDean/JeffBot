require 'active_record'
require_relative '../models/entries'

# The class WordChain attempts to chain words together
# it is mostly like Markov
class WordChain
  class << self
    def next_word(previous_tokens)
      find_best_token(
        Entries.where(word: previous_tokens[0], nword: previous_tokens[1])
          .order(count: :desc).pluck(:definition, :count).to_h
      )
    end

    def bigram_word(previous_token)
      find_best_token(
        Entries.where(word: previous_token).order(count: :desc).pluck(:nword, :count).to_h
      )
    end

    private

    def find_best_token(tokens)
      return '' unless tokens.any?

      old_count = 0
      tokens.each do |word, count|
        old_count += count
        ap old_count
        ap count
        ap old_count/(tokens.values.inject(:+))
        ap (old_count/(tokens.values.inject(:+)))*5
        return word if rand < ((old_count/(tokens.values.inject(:+)))*5)
      end

      tokens.keys.last
    end
  end
end
