require_relative 'markov'
require_relative 'lexicon'

# This is the bot
class Botsolver
  def self.go(arg)
    query = Lexicon.clean(arg)
    Markov.go(query)
  end
end
