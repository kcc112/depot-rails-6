class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    begin
      product = Product.find(params[:id])

      @line_item = @cart.line_items.build(product: product)

      respond_to do |format|
        if @line_item.save
          format.html { redirect_to products_path, notice: 'Line item was successfully created.' }
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
end