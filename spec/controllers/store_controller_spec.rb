require 'rails_helper'

RSpec.describe StoreController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template :index }
    end

    context 'product' do
      let(:product1) { create :product }
      let(:product2) { create :product }

      it 'should return all products' do
        expect(assigns(:products)).to match_array([product1, product2])
      end
    end
  end
end
