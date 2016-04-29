require 'engtagger'

# Lexicon parses a sentence Lexographically
module Lexicon
  class << self
    def clean(str)
      result = ''
      get_tokens(str).each do |token|
        result = result + ' ' + token.gsub(/[^a-zA-Z]/, '')
      end
      result.strip.downcase
    end

    def get_subject(query)
      tagger = EngTagger.new
      nouns = tagger.get_nouns(tagger.add_tags(query)).keys.sample
      return nouns unless nouns.nil?
      query.split(' ').sample
    end

    def get_tokens(query)
      query.split(' ')
    end

    def get_number_of_tokens(query)
      get_tokens(query).length
    end

    def equal_tokens?(a, b)
      get_number_of_tokens(a) == get_number_of_tokens(b)
    end
  end
end
