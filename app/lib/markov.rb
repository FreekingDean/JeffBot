require_relative 'ngram'
require_relative 'lexicon'
require_relative 'formulator'
require_relative 'learn'

# Markov saves the the Ngrams gets the subject and
# forms the next sentence
class Markov
  def self.go(query)
    if Lexicon.get_number_of_tokens(query) >= 3
      grams = Ngram.trigram(query)
      Learn.train_array(grams)
    end
    subject = Lexicon.get_subject(query)
    Formulator.create_sentence_random(subject)
  end
end
