class TourController < ApplicationController
  def index
    @all_tours = Tour.all
    @food_and_drink = Tour.joins(:provider).where(category:"food_and_drink")
    @water_sports = Tour.joins(:provider).where(category:"water_sports")
    @neighborhood_tours = Tour.joins(:provider).where(category:"neighborhood_tours")
    @landmarks = Tour.joins(:provider).where(category:"landmarks")
  end

  def show
    @tour = Tour.joins(:provider).find(params[:id])
    @review = Review.joins(:user).where(tour_id:params[:id])
  end

  def new
  end

  def edit
    @edit_tour = Tour.new
    @update_tour = Tour.find(params[:id])
  end

  def create
    @new_tour = Tour.new(tour_params)
    respond_to do |format|
      if @new_tour.save
        format.html { redirect_to "/provider", notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: "/provider"}
      else
        format.html { redirect_to "/provider", notice: @new_tour.errors.full_messages}
        format.json { render json: @new_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # render json:params
    Tour.find(params[:id]).update(update_params)
    redirect_to '/provider'
  end
  def update_pic
    Tour.find(params[:id]).update(tour_pic:params[:tour][:change_pic])
    redirect_to '/provider'
  end

  def destroy
    Tour.find(params[:id]).destroy
    redirect_to '/provider'
  end

  private
  def tour_params
    params.require(:tour).permit(:name, :description, :itinerary, :category, :provider_id, :tour_pic)
  end
  def reserve_params
    params.require(:reserve).permit(:tour_date, :provider, :tour, :name)
  end
  def update_params
    params.require(:tour).permit(:name, :description, :category)
  end
end
