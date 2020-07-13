require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #index' do
    before { get :index }

    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template :index }
    end

    context 'products' do
      let(:product1) { create :product }
      let(:product2) { create :product }

      it 'should return all products' do
        expect(assigns(:products)).to match_array([product1, product2])
      end
    end
  end

  describe 'GET #new' do
    before { get :new }

    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template :new }
    end

    context 'product' do
      it 'should return product' do
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product).persisted?).to eq(false)
      end
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { product: attributes_for(:product) } }
    let(:invalid_attributes) { { product: attributes_for(:product, title: nil) } }

    context 'valid attributes' do
      subject { post :create, params: valid_attributes }
      it { is_expected.to redirect_to action: :show, id: assigns(:product).id }
      it { expect { subject }.to change(Product, :count).by(1) }
    end

    context 'invalid attributes' do
      subject { post :create, params: invalid_attributes }
      it { is_expected.to render_template :new }
      it { expect { subject }.to_not change(Product, :count) }
    end
  end

  describe 'GET #edit' do
    let(:product) { create(:product) }
    before { get :edit, params: { id: product.id } }

    describe 'successful response' do
      it { expect(response).to be_successful }
      it { expect(response).to render_template :edit }
    end

    context 'product' do
      it 'should return event by given id' do
        expect(assigns(:product)).to eq(product)
      end
    end
  end

  describe 'PUT #update' do
    let(:product) { create(:product) }

    let(:valid_attributes) { { id: product.id, product: attributes_for(:product) } }
    let(:invalid_attributes) { { id: product.id, product: attributes_for(:product, title: nil) } }

    context 'valid attributes' do
      subject { put :update, params: valid_attributes }
      
      it { is_expected.to redirect_to(:product) }

      it 'should redirect with notice' do
        subject
        expect(flash[:notice]).to be_present
      end

      it 'should update product' do
        subject
        expect(product.reload.title).to eq(valid_attributes[:product][:title])
      end
    end

    context 'invalid attributes' do
      subject { put :update, params: invalid_attributes }
      it { is_expected.to render_template :edit }
      it { expect { subject }.not_to change(product, :title) }
      it { expect { subject }.not_to change(product, :description) }
      it { expect { subject }.not_to change(product, :image_url) }
    end
  end

  describe 'DELETE #destroy' do
    let(:product) { create(:product) }
    subject { delete :destroy, params: { id: product.id } }

    it { is_expected.to redirect_to products_url }

    it 'should redirect with notice' do
      subject
      expect(flash[:notice]).to be_present
    end

    it 'should delete project' do
      product
      expect { subject }.to change(Product, :count).by(-1)
    end
  end

end
