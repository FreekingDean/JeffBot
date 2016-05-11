require 'spec_helper'

describe Botsolver do
  subject { Botsolver }
  let(:phrase) { "This is a cool cool string. Written by Dean's finest." }
  let(:cleaned_phrase) { Lexicon.clean(phrase) }

  it 'should clean the argument' do
    expect(Lexicon).to receive(:clean).with(%r(#{phrase}|#{cleaned_phrase})).at_least(:once).and_return(cleaned_phrase)
    Botsolver.go(phrase)
  end

  it 'should call Markov with the cleaned phrase' do
    expect(Markov).to receive(:go).with(cleaned_phrase).exactly(:once)
    Botsolver.go(phrase)
  end
end
