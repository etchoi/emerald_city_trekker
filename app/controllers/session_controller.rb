class SessionController < ApplicationController
  def index
    @all_tours = Tour.last(3)
  end

  def show

  end

  def new
  end

  def edit
  end

  def create
    @provider = Provider.find_by(email: params[:login][:email].downcase)
    respond_to do |format|
      if @provider && @provider.authenticate(params[:login][:password])
        session[:active] = @provider.id
        format.html { redirect_to "/provider"}
        format.json { render :show, status: :created, location: "/provider"}
      else
        format.html { redirect_to '/provider/new',   notice: 'Your email and/or password were incorrect. Get your life together and try again'}
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end
end
