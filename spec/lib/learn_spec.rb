require 'spec_helper'

describe Learn do
  subject { described_class }
  it { is_expected.to respond_to :train_phrase }
  it { is_expected.to respond_to :train_array }
  it { is_expected.to respond_to :train }
end
