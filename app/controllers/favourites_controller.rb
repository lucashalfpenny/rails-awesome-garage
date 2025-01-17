class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.all
  end

  def create
    @car = Car.find(params[:car_id])
    @favourite = Favourite.new
    @favourite.car = @car

    if @favourite.save
      redirect_to favourites_path, notice: "Saved to your favourites"
    else
      render 'cars/show', status: :unprocessable_entity
    end
  end

  def destroy
    @favourite = Favourite.find(params['id'])
    @favourite.destroy
    redirect_to favourites_path, status: :see_other
  end
end
