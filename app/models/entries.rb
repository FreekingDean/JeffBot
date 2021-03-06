class Entries < ActiveRecord::Base
  attr_accessor :probability

  def self.get_words(gram_1:, gram_2: nil)
    other = []
    scope = Entries.select('word, sum(count) as count').where(gram_1: gram_1)
    if gram_2.nil?
      other = Entries.select('gram_1 as word, sum(count) as count').where(gram_2: gram_1).group(:gram_1).order('count DESC').to_a
    else
      scope = scope.where(gram_2: gram_2)
    end
    (scope.group(:word).order('count DESC').to_a + other).sort {|a, b| b.count <=> a.count}
  end
end
