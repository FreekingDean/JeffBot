require 'spec_helper'

describe Learn do
  subject { described_class }
  it { is_expected.to respond_to :train_phrase }
  it { is_expected.to respond_to :train_array }
  it { is_expected.to respond_to :train }

  it 'can learn a phrase' do
    expect{Learn.train_phrase("this is a test")}.to_not raise_error
    expect(Entries.last.tag).to eq 'VBZ'
  end
  it 'can learn a phrase' do
    expect{Learn.train_array([['this', 'is', 'test']], ['N'])}.to change { Entries.count}.by(1)
  end
end
