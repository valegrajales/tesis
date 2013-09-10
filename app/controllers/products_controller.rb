class ProductsController < ApplicationController
  # ============
  # Filters
  # ============
  before_filter(execpt: [:new, :create]) { |c| c.signed_in_filter USER_TYPE_ANY }
  before_filter(only: [:new, :create]) { |c| c.signed_in_filter USER_TYPE_STUDENT }

  # ============
  # Actions
  # ============
  def new
    thesis = Thesis.find params[:thesis_id]
    @product = thesis.products.build
  end

  def create
    thesis = Thesis.find params[:product][:thesis_id]
    @product = thesis.products.build(description: params[:product][:description])
    if @product.save
      flash[:success] = 'Your product has been created successfully.'
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def all
    @found_products = Product.find_all_by_thesis_id(params[:thesis_id])
  end
end
