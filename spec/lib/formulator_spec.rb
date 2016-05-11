require 'spec_helper'

describe Formulator do
  subject { described_class }
  it { is_expected.to respond_to :create_sentence }
  it { is_expected.to respond_to :create_sentence_random }
end
