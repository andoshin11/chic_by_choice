require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { item }

  let(:item) { build(:item) }

  context 'when built from factory' do
    it { is_expected.to be_valid }
  end

end
