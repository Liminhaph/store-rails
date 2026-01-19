class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      ProductMailer.new_product(@product).deliver_later
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def require_admin!
    unless current_user.admin?
      redirect_to products_path, alert: "Você não tem permissão para realizar essa ação."
    end
  end

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price,
      :ice_type,
      :in_stock
    )
  end
end

