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

  describe 'DELETE #destroy' do
    let(:cart) { create :cart }
    subject { delete :destroy, params: { id: cart.id}, session: { cart_id: cart.id } }

    it { is_expected.to redirect_to store_index_url }
    
    it 'should redirect with notice' do
      subject
      expect(flash[:notice]).to be_present
    end

    it 'should delete cart' do
      cart
      expect { subject }.to change(Cart, :count).by(-1)
    end
  end
end