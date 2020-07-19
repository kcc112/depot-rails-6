require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  describe 'POST #create' do
    let(:product) { create :product } 
    let(:valid_attributes) { { product_id: product.id, line_item: attributes_for(:line_item, product_id: product.id) } }
    let(:invalid_attributes) { { line_item: attributes_for(:line_item) } }

    context 'valid attributes' do
      subject { post :create, params: valid_attributes }
      it { is_expected.to redirect_to store_index_url}
      it { expect { subject }.to change(LineItem, :count) }
    end

    context 'invalid attributes' do
      subject { post :create, params: invalid_attributes }
      it { is_expected.to redirect_to store_index_path }
      it { expect { subject }.to_not change(LineItem, :count) }
    end
  end

  describe '#DELETE destroy' do
    let(:product) { create :product } 
    let(:cart) { create :cart }
    let(:line_item) { create :line_item, cart_id: cart.id, product_id: product.id }
    subject { delete :destroy, params: { id: line_item.id }, session: { cart_id: cart.id } }

    it { is_expected.to redirect_to cart }

    it 'should redirect with notice' do
      subject
      expect(flash[:notice]).to be_present
    end

    it 'should remove line item' do
      line_item
      expect { subject }.to change(LineItem, :count).by(-1)
    end
  end
end