class TourController < ApplicationController
  def index

  end

  def show
  end

  def new
  end

  def edit
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
  end

  private
  def tour_params
    params.require(:tour).permit(:name, :description, :category, :provider_id)
  end
end
