require 'spec_helper'

describe Responder do
  subject { described_class }
  it { is_expected.to respond_to :go }
end
