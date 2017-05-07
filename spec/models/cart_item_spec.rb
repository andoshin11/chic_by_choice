require 'rails_helper'

RSpec.describe CartItem, type: :model do
  subject { cart_item }

  let(:cart_item) { build(:cart_item) }

  context 'when built from factory' do
    it { is_expected.to be_valid }
  end

  describe '#price' do
    context 'when nil' do
      let(:cart_item) { build(:cart_item, price: nil) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#cart_id' do
    context 'when nil' do
      let(:cart_item) { build(:cart_item, cart_id: nil) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#unit_id' do
    context 'when nil' do
      let(:cart_item) { build(:cart_item, unit_id: nil) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#currency_id' do
    context 'when nil' do
      let(:cart_item) { build(:cart_item, currency_id: nil) }

      it { is_expected.to be_invalid }
    end
  end
  describe '#name' do
    context 'when nil' do
      let(:cart_item) { build(:cart_item,  name: nil) }

      it { is_expected.to be_invalid }
    end

    context 'when blank' do
      let(:cart_item) { build(:cart_item,  name: "") }

      it { is_expected.to be_invalid }
    end
  end

  describe '#num_units' do
    context 'when nil' do
      let(:cart_item) { build(:cart_item, num_units: nil) }

      it { is_expected.to be_invalid }
    end
  end

end
