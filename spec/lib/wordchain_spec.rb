require 'spec_helper'

describe WordChain do
  subject { described_class }
  it { is_expected.to respond_to :next_word }
end
