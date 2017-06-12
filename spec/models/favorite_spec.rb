require 'rails_helper'

RSpec.describe Favorite, type: :model do
  subject { favorite }

  let(:favorite) { build(:favorite) }

  context 'when built from factory' do
    it { is_expected.to be_valid }
  end

  describe '#favorite_list_id' do
    context 'when nil' do
      let(:favorite) { build(:favorite, favorite_list_id: nil) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#item_id' do
    context 'when nil' do
      let(:favorite) { build(:favorite, item_id: nil) }

      it { is_expected.to be_invalid }
    end
  end

end
