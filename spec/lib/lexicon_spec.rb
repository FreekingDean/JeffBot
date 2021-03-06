require 'spec_helper'

describe Lexicon do
  subject { described_class }
  it { is_expected.to respond_to :clean }
  it { is_expected.to respond_to :clean! }
  it { is_expected.to respond_to :get_subject }
  it { is_expected.to respond_to :get_tokens }
  it { is_expected.to respond_to :get_number_of_tokens }
  it { is_expected.to respond_to :equal_tokens? }
end
