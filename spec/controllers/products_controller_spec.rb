require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #index' do
    subject { get :index }

    describe 'successful response' do
      before { subject }
      it { expect(response).to be_successful }
      it { expect(response).to render_template(:index) }
    end

    context 'products' do
      let!(:product1) { create :product }
      let!(:product2) { create :product }

      it 'should return all products' do
        subject
        expect(assigns(:products)).to match_array([product1, product2])
      end
    end
  end
  
end
