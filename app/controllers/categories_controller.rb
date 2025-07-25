class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = current_user.categories
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = current_user.categories.build
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to @category, notice: "Your Category was successfully created!"
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category Updated!"
    else
      render :edit
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Category has been deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
