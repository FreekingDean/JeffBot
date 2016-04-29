require 'active_record'
require_relative '../models/entries'

# The class WordChain attempts to chain words together
# it is mostly like Markov
class WordChain
  class << self
    def next_word(previous_tokens)
      find_best_token(
        Entries.where(word: previous_tokens[0], nword: previous_tokens[1])
          .order(count: :desc).pluck(:definition)
      )
    end

    def bigram_word(previous_token)
      find_best_token(
        Entries.where(word: previous_token).order(count: :desc).pluck(:nword)
      )
    end

    private

    def find_best_token(tokens)
      return '' if tokens.length.blank?

      tokens.each do |token|
        return token if rand < 0.75
      end

      tokens.last
    end
  end
end
