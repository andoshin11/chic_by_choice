require 'rails_helper'

RSpec.describe Unit, type: :unit do
  subject { unit }

  let(:unit) { build(:unit) }

  context 'when built from factory' do
    it { is_expected.to be_valid }
  end

  describe '#name' do
    context 'when nil' do
      let(:unit) { build(:unit, name: nil) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#price' do
    context 'when nil' do
      let(:unit) { build(:unit, price: nil) }

      it { is_expected.to be_invalid }
    end
  end

end
