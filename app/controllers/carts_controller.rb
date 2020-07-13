class CartsController < ApplicationController
  before_action :set_cart, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_index_url, notice: 'Invalid cart'
    end
end