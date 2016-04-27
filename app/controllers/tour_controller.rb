class TourController < ApplicationController
  def index
    @all_tours = Tour.all
    @food_and_drink = Tour.joins(:provider).where(category:"food_and_drink")
    @water_sports = Tour.joins(:provider).where(category:"water_sports")
    @neighborhood_tours = Tour.joins(:provider).where(category:"neighborhood_tours")
    @landmarks = Tour.joins(:provider).where(category:"landmarks")
  end

  def show
  end

  def new
  end

  def edit
  end

  def reserve
    render json:reserve_params
  end

  def create
    @new_tour = Tour.new(tour_params)
    respond_to do |format|
      if @new_tour.save
        format.html { redirect_to "/provider/#{session[:provder]}", notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: "/provider"}
      else
        format.html { redirect_to '/tour/new', notice: @new_tour.errors.full_messages}
        format.json { render json: @new_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    Tour.find(params[:id]).destroy
    redirect_to '/provider'
  end

  private
  def tour_params
    params.require(:tour).permit(:name, :description, :category, :provider_id, :tour_pic)
  end
  def reserve_params
    params.require(:reserve).permit(:date)
  end
end
