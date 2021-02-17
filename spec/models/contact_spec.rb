require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'factory' do
    context "normal" do
      it { expect(build(:contact)).to be_valid }
    end
  end
end