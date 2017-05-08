require 'rails_helper'

RSpec.describe Unit, type: :model do
  subject { unit }

  let(:unit) { build(:unit) }

  context 'when built from factory' do
    it { is_expected.to be_valid }
  end

  describe '#size' do
    context 'when nil' do
      let(:unit) { build(:unit, size: nil) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#length' do
    context 'when nil' do
      let(:unit) { build(:unit, length: nil) }

      it { is_expected.to be_invalid }
    end
  end

end
