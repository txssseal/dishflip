class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new
    @meal.restaurant_id = params[:restaurant_id]
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(meal_params)
    @hello = new_meal_path



    respond_to do |format|
      if @meal.save
        format.html { redirect_to @hello, notice: 'Meal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meal }
      else
        format.html { render action: 'new' }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :no_content }
    end
  end

  def destroy_multiple

    Meal.destroy(params[:meal_ids_delete])

    respond_to do |format|
      format.html { redirect_to meals_path }
      format.json { head :no_content }
    end
  end

  def edit_individual
   @meal = Meal.find(params[:meal_ids])
  end

  def update_individual
    Meal.update(params[:meals].keys, params[:meals].values)
    flash[:notice] = "Meals updated"
    redirect_to meals_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:meal_name, :meal_price, :cuisine_type, :restaurant_id,
                     :meal_photo)
    end
end
