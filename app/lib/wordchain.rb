require 'active_record'
require_relative '../models/entries'

# The class WordChain attempts to chain words together
# it is mostly like Markov
class WordChain
  class << self
    def next_word(previous_tokens)
      find_best_token(Entries.get_words(gram_1: previous_tokens[1], gram_2: previous_tokens[0]))
    end

    def bigram_word(previous_token)
      find_best_token(Entries.get_words(gram_1: previous_token))
    end

    private

    def find_best_token(tokens)
      return '' unless tokens.any?

      old_count = 0
      total_count = tokens.map(&:total).inject(0, :+)
      tokens.reverse.each do |entries|
        old_count += entries.total
        return entries.word if (rand * 1.2) < (old_count / total_count) && rand < 0.5
      end

      tokens.last.word
    end
  end
end
