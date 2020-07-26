require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('name', 'address', 'email', 'pay_type') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to define_enum_for(:pay_type).with_values(["Check", "Credit card", "Purches order"]) }
  end

  describe 'relations' do
    it { is_expected.to have_many :line_items }
  end
end