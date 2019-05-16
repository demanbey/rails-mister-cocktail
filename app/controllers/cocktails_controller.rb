class CocktailsController < ApplicationController

  def index
    @cocktail = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    new_cocktail = Cocktail.new(cocktail_params)
    new_cocktail.save

    redirect_to cocktail_path(new_cocktail)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
