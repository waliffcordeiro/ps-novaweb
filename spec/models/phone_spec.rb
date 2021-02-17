require 'rails_helper'

RSpec.describe Phone, type: :model do
  describe 'factory' do
    context "normal" do
      it { expect(build(:phone)).to be_valid }
    end
  end
end