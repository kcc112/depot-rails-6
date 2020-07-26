require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    describe 'empty cart response' do
      it { expect(response).to redirect_to store_index_path }
      it { expect(flash[:notice]).to be_present }
    end
  end
end