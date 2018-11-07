class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %w[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant_reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy

  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
