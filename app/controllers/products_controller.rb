class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :price))
    if @product.save
      flash[:notice] = "productを新規登録しました"
      redirect_to :products
    else
      render "new"
    end
  end

  def show
    @product = Product.find(params[:id])
    @reservations = @product.reservations
    @reservation = @reservations.new
  end
end
