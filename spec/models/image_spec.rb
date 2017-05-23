require 'rails_helper'

RSpec.describe Image, type: :model do
	subject { image }

	let!(:image) { build(:image) }

	context 'when build from factory' do
		it { is_expected.to be_valid }
	end

  describe '#url' do
    context 'when nil' do
      let(:image) { build(:image, url: nil) }

      it { is_expected.to be_invalid }
    end
  end

end
