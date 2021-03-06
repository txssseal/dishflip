class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]


  # GET /restaurants
  # GET /restaurants.json
  def index
    @meals = Meal.order('RANDOM()')
    @restaurants = Restaurant.all
    @locations = Location.all
  respond_to do |format|
    format.html
    format.json { render json: @restaurants }
  end

  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @meals = @restaurant.meals
    @restaurant = Restaurant.find(params[:id]) 
    @meal = Meal.new
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @restaurant.locations.build
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def authenticate_admin!
      # check if current user is admin
      unless current_user.admin
        # if current_user is not admin redirect to some route
        redirect_to root_path
      end
      # if current_user is admin he will proceed to edit action
  end

   

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:restaurant_name, :restaurant_logo, :email,
        :facebook, :website, :phone)
    end
end
