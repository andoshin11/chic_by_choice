require 'rails_helper'

RSpec.describe Currency, type: :model do
  subject { currency }

  let(:currency) { build(:currency) }

  context 'when built from factory' do
    it { is_expected.to be_valid }
  end

  describe '#name' do
    context 'when nil' do
      let(:currency) { build(:currency, name: nil) }

      it { is_expected.to be_invalid }
    end
  end

  describe '#iso_code' do
    context 'when nil' do
      let(:currency) { build(:currency, iso_code: nil) }

      it { is_expected.to be_invalid }
    end
  end

end
