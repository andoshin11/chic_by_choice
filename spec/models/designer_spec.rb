require 'rails_helper'

RSpec.describe Designer, type: :model do
	subject { designer }

	let(:designer) { build(:designer) }

	context 'when build from factory' do
		it { is_expected.to be_valid }
	end

  describe '#name' do
    context 'when nil' do
      let(:designer) { build(:designer, name: nil) }

      it { is_expected.to be_invalid }
    end
  end
end
