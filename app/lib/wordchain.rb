require 'active_record'
require_relative '../models/entries'

# The class WordChain attempts to chain words together
# it is mostly like Markov
class WordChain
  class << self
    def next_word(previous_tokens)
      find_best_token(Entries.get_words(gram_1: previous_token[1], gram_2: previous_tokens[0]))
    end

    def bigram_word(previous_token)
      find_best_token(Entries.get_words(gram_1: previous_token))
    end

    private

    def find_best_token(tokens)
      return '' unless tokens.any?

      old_count = 0
      total_count = tokens.map(&:total).inject(:+)
      tokens.each do |word, count|
        old_count += count
        return word if rand < (old_count / total_count)
      end

      tokens.keys.last
    end
  end
end
