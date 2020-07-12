require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'relstions' do
    it { is_expected.to have_many(:line_items).dependent(:destroy) }
  end
end