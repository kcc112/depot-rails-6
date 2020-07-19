class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_product

  def create
    begin
      product = Product.find(params[:product_id])
      @line_item = @cart.add_product(product)

      respond_to do |format|
        if @line_item.save
          format.html { redirect_to @cart, notice: 'Line item was successfully created.' }
        else
          format.html { redirect_to products_path, notice: 'Something went wrong.' }
        end
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to store_index_path
    end
  end

  private
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end

    def invalid_product
      logger.error "Attempt to access invalid product #{params[:id]}"
      redirect_to store_index_url, notice: 'Invalid product'
    end
end