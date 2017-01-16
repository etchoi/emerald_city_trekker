class ReviewController < ApplicationController
  def index
  end

  def show
    @tour = Tour.joins(:provider).find(params[:id])
  end

  def new
    @provider_profile = Provider.joins(:tour).find(params[:id])
    @provider_rating = Review.joins(:user).where(guide:params[:id])
  end

  def edit
  end

  def create
    @review = Review.new(rating:params[:rating][:rating], content:params[:rating][:comment], user_id:session[:user], provider_id:params[:rating][:provider], tour_id:params[:rating][:tour])
    respond_to do |format|
      if @review.save
        session[:provider] = @review.id
        format.html { redirect_to "/tour", notice: 'Thanks for the review!' }
        format.json { render :show, status: :created, location: "/tour"}
      else
        format.html { redirect_to '/review/new', notice: @review.errors.full_messages}
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end
end
