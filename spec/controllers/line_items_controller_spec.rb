require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  describe 'POST #create' do
    let(:product) { create :product } 
    let(:valid_attributes) { { product_id: product.id, line_item: attributes_for(:line_item, product_id: product.id) } }
    let(:invalid_attributes) { { line_item: attributes_for(:line_item) } }

    context 'valid attributes' do
      subject { post :create, params: valid_attributes }
      it { is_expected.to redirect_to product.line_items[0].cart}
      it { expect { subject }.to change(LineItem, :count) }
    end

    context 'invalid attributes' do
      subject { post :create, params: invalid_attributes }
      it { is_expected.to redirect_to store_index_path }
      it { expect { subject }.to_not change(LineItem, :count) }
    end
  end
end