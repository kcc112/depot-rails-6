require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'relstions' do
    it { is_expected.to belong_to :cart }
    it { is_expected.to belong_to :product }
  end
end