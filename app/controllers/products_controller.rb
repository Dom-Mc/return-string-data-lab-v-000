class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def description
    description = Product.find(params[:id]).description
    render plain: description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? "true" : "false"
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
