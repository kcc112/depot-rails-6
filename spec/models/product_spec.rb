require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('title', 'description', 'image_url') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:image_url) }
  end

  describe 'relations' do
    it { is_expected.to have_many :line_items }
  end

  describe 'before_destroy' do
    let!(:product) { create(:product) }
    let!(:cart) { create(:cart) }
    let!(:line_item) { create(:line_item, product_id: product.id, cart_id: cart.id) }

    it 'should not destroy product' do
      product.destroy
      expect(product).not_to be_destroyed
      expect(product.errors[:base]).to eq ['Line Item present']
    end

    it 'should destroy product' do
      line_item.destroy
      expect { product.destroy }.to change(Product, :count).by(-1)
      expect(product).to be_destroyed
    end
  end
end
