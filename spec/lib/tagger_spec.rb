require 'spec_helper'

describe Tagger do
  subject { described_class.new('This is a test for Dean.') }
  let(:tag_hash) {{'This'=>'DET', 'is'=>'VBZ', 'a'=>'DET', 'test'=>'NN', 'for'=>'IN', 'Dean'=>'NNP', '.'=>'PP'} }
  it 'can identify nouns' do
    expect(subject.nouns).to eq ['test', 'Dean']
  end

  it 'can identify proper nouns' do
    expect(subject.proper_nouns).to eq ['Dean']
  end

  it 'can generate a tag hash' do
    expect(subject.tag_hash).to eq tag_hash
  end

  it 'can generate a tag array' do
    expect(subject.tag_array).to eq tag_hash.values
  end
end
