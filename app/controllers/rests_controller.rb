class RestsController < ApplicationController
  before_action :set_rest, only: [:show, :edit, :update, :destroy]

  # GET /rests
  def index
    @rests = Rest.all
  end

  # GET /rests/1
  def show
  end

  # GET /rests/new
  def new
    @rest = Rest.new
  end

  # GET /rests/1/edit
  def edit
  end

  # POST /rests
  def create
    @rest = Rest.new(rest_params)

    if @rest.save
      redirect_to @rest, notice: 'Rest was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rests/1
  def update
    if @rest.update(rest_params)
      redirect_to @rest, notice: 'Rest was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rests/1
  def destroy
    @rest.destroy
    redirect_to rests_url, notice: 'Rest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rest
      @rest = Rest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rest_params
      params.require(:rest).permit(:restaurant_name, :meal_name, :meal_price,
       :restaurant_area, :restaurant_address, :cuisine_type, :picture )
    end
end
