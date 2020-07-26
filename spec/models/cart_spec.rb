require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:line_items).dependent(:destroy) }
  end
end