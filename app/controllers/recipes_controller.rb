class RecipesController < ApplicationController
  def index
    @recipes = Unirest.get("localhost:3000/api/v1/recipes.json").body
  end

  def new
  end

  def create
    @recipe = Unirest.post("localhost:3000/api/v1/recipes",
                           headers: {"Accept" => "application/json"},
                           parameters: {
                             meat: params[:meat],
                             vegetable: params[:vegetable],
                             ingredient: params[:ingredient],
                             spice: params[:spice],
                             measurement: params[:measurement],
                             cook_time: params[:cook_time],
                             instructions: params[:instructions]
                           }).body

    redirect_to "/recipes/#{@recipe['id']}"
  end

  def show
    recipe_number = params[:id]
    @recipe = Unirest.get("localhost:3000/api/v1/recipes/#{recipe_number}.json").body
  end
end
