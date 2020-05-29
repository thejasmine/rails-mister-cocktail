class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all.order(name: :asc)
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @cocktails = Cocktail.where(name: @name)
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  def filter
    @ingredient = Ingredient.find_by(name: params[:ingredient])
    @cocktail = @ingredient.cocktails
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
