require 'spec_helper'

describe Learner do
  subject { described_class }
  it { is_expected.to respond_to :go }
end
