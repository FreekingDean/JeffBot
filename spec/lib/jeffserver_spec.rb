require 'spec_helper'

describe JeffServer do
  subject { described_class.new(nil) }
  it { is_expected.to respond_to :start }
  it { is_expected.to respond_to :learn }
  it { is_expected.to respond_to :respond }
end
