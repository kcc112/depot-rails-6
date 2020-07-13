require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'GET #show' do
    let(:product) { create :product } 
    let(:cart) { create :cart }
    let(:line_item) { create :line_item, cart_id: cart.id, product_id: product.id }
    subject { get :show, params: { id: cart.id } }

    describe 'successful response' do
      before { subject }
      it { is_expected.to be_successful }
      it { is_expected.to render_template :show }
    end

    context 'cart' do
      before { subject }
      it 'should return line_items list' do
        line_item
        expect(assigns(:cart).line_items.count).to eq 1
      end
    end
  end
end