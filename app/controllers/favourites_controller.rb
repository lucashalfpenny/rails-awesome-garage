class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.all
  end

  def create
    @car = Car.find(params[:car_id])
    @favourite = Favourite.new
    @favourite.car = @car

    if @favourite.save
      redirect_to favourites_path
    else
      render 'cars/show', status: :unprocessable_entity
    end
  end
end
