class ProductsController < ApplicationController
  # Garante que apenas usuários autenticados possam acessar as ações
  before_action :authenticate_user!

  # Lista todos os produtos (gelos)
  def index
    @products = Product.all
  end

  # Exibe um produto específico
  def show
    @product = Product.find(params[:id])
  end

  # Formulário para criar um novo produto
  def new
    @product = Product.new
  end

  # Cria um novo produto no banco
  def create
    @product = Product.new(product_params)

    if @product.save
      # Envia e-mail notificando novo produto cadastrado
      ProductMailer.new_product(@product).deliver_later

      redirect_to @product
    else
      # Reexibe o formulário caso haja erro de validação
      render :new, status: :unprocessable_entity
    end
  end

  # Formulário de edição do produto
  def edit
    @product = Product.find(params[:id])
  end

  # Atualiza os dados do produto
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Remove o produto do sistema
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private

  # Strong Parameters:
  # Define quais campos podem ser recebidos via formulário
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price,
      :ice_type
    )
  end
end
