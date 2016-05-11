require 'spec_helper'

describe Ngram do
  subject { described_class }
  it { is_expected.to respond_to :ngrams }
end
