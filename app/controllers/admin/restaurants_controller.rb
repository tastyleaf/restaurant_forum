class Admin::RestaurantsController < Admin::BaseController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  
  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "Restaurant was failed to create"
      render :new
    end 
  end

   def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "Restaurant was successfully updated"
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "Restaurant was failed to update"
      render :edit
    end 
     
   end

   def destroy
    @restaurant.destroy
    flash[:alert] = "Restaurant was deleted"
    redirect_to admin_restaurants_path
   end


  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description, :image, :category_id)
  end


end
