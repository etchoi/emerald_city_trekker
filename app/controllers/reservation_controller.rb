class ReservationController < ApplicationController
  def index
    Request.find(params[:id]).delete
    @scheduled = Scheduled.new(tour_date: , user_id: , provider_id: , tour_id: )
    respond_to do |format|
      if @reserve.save
        format.html { redirect_to "/tour", notice: 'We sent a request to ' + params[:reserve][:name] + '. We will let you know when ' + params[:reserve][:name] + ' replies to your request.' }
        format.json { render :show, status: :created, location: "/user"}
      else
        format.html { redirect_to '/tour', notice: @new_tour.errors.full_messages}
        format.json { render json: @new_tour.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @reserve = Request.new(tour_date:params[:reserve][:tour_date],user_id:session[:user],provider_id:params[:reserve][:provider], tour_id:params[:reserve][:tour])
    respond_to do |format|
      if @reserve.save
        format.html { redirect_to "/tour", notice: 'We sent a request to ' + params[:reserve][:name] + '. We will let you know when ' + params[:reserve][:name] + ' replies to your request.' }
        format.json { render :show, status: :created, location: "/user"}
      else
        format.html { redirect_to '/tour', notice: @new_tour.errors.full_messages}
        format.json { render json: @new_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    Request.find(params[:id]).delete
    redirect_to '/provider'
  end
end
