class Entries < ActiveRecord::Base
  def self.get_words(gram_1:, gram_2: nil)
    ap gram_2
    scope = Entries.select('word, sum(count) as total').where(gram_1: gram_1)
    scope = scope.where(gram_2: gram_2) unless gram_2.nil?
    ap scope.to_sql
    scope.group(:word).order('total DESC').to_a
  end
end
