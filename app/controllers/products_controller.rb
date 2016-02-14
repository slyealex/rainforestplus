class ProductsController < ApplicationController
  before_action :load_product, only: [:show, :edit, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show

    if current_user
      @review = @product.reviews.build
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to products_path(@product)
    else
      render :edit
    end
  end

  def destroy

    @product.delete
    redirect_to products_path
  end

  def help

  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

  def load_product
    @product = Product.find(params[:id])
  end
end
