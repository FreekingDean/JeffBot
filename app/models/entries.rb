class Entries < ActiveRecord::Base
  attr_accessor :total

  def self.get_words(gram_1:, gram_2: nil)
    scope = Entries.select('word, sum(count) as total').where(gram_1: gram_1)
    scope = scope.where(gram_2: gram_2) unless gram_2.nil?
    scope.group(:word).order('total DESC').to_a
  end
end
