require 'spec_helper'

describe Formulator do
  subject { described_class }
  it { is_expected.to respond_to :create_sentence }
  it { is_expected.to respond_to :create_sentence_random }
  before(:each) do
    allow(WordChain).to receive(:bigram_word).and_return(next_word)
    allow(WordChain).to receive(:next_word).and_return(next_word)
  end

  it 'should be able to create a sentence' do
    expect(subject.create_sentence(3, next_word)).to eq ([next_word]*5).join(' ')+"."
  end
end

def next_word
  'Test'
end
