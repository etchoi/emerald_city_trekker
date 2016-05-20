class ReviewController < ApplicationController
  def index
  end

  def show
  end

  def new
    @provider_profile = Provider.find(params[:id])
  end

  def edit
  end

  def create
    @review = Review.new(rating:params[:rating][:rating], content:params[:rating][:comment], user_id:session[:user], guide:params[:rating][:provider])
    respond_to do |format|
      if @review.save
        session[:provider] = @review.id
        format.html { redirect_to "/tour", notice: 'Your profile was successfully created.' }
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
