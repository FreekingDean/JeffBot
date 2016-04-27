require 'engtagger'
module Lexicon
  def Lexicon.clean(str)
    result = ""
    Lexicon.get_tokens(str).each do |token|
      result = result + " " + token.gsub(/[^a-zA-Z]/, "")
    end
    return result.strip.downcase
  end
  def Lexicon.get_subject(query)
    tagger = EngTagger.new
    nouns = tagger.get_nouns(tagger.add_tags(query)).keys.sample
    return nouns unless nouns.nil?
    return query.split(" ").sample
  end
  def Lexicon.get_tokens(query)
    return query.split(" ")
  end
  def Lexicon.get_number_of_tokens(query)
    return Lexicon.get_tokens(query).length
  end
  def Lexicon.has_equal_tokens(a, b)
    if Lexicon.get_number_of_tokens(a) == Lexicon.get_number_of_tokens(b)
      return true
    else
      return false
    end
  end
end
