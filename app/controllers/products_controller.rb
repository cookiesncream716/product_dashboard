class ProductsController < ApplicationController
  def index
    @products = Product.get_all
  end

  def show
    @product = Product.get_product(params[:id])
    @comments = Comment.all
  end

  def new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
    @product = Product.get_product(params[:id])
  end

  def create
    @product = Product.create_product(product_params)
    redirect_to "/products"
  end

  def update
    @product = Product.update_product(params[:id], product_params)
    redirect_to "/products"
  end

  def destroy
    Product.delete_product(params[:id])
    redirect_to "/products"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :pricing).merge(:category => Category.find(params["product"][:category].to_i))
  end
end
