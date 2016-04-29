# Ngram fings a set of Xgrams in a sentence
class Ngram
  class << self
    def ngrams(n, string)
      string.split(' ').each_cons(n).to_a
    end

    def bigram(string)
      ngrams(2, string)
    end

    def trigram(string)
      ngrams(3, string)
    end
  end
end
