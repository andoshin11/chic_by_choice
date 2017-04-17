require 'rails_helper'

RSpec.describe UnitImage, type: :model do
  subject { unit_image }

  let(:unit_image) { build(:unit_image) }

  context 'when built from factory' do
    it { is_expected.to be_valid }
  end

  describe '#url' do
    context 'when nil' do
      let(:unit_image) { build(:unit_image, url: nil) }

      it { is_expected.to be_invalid }
    end
  end

end
