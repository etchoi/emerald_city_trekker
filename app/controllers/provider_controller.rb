class ProviderController < ApplicationController
  def index
    @providers = Provider.find(session[:provider])
    @tour = Tour.new
    @tours = Tour.where(provider_id:session[:provider])
    @pending = Request.joins(:user).joins(:tour).where(provider_id:session[:provider])
    @scheduled = Scheduled.joins(:tour).joins(:user).where(provider_id:session[:provider])
  end

  def show
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def provider_login
    @provider = Provider.find_by(email: params[:login][:email].downcase)
    respond_to do |format|
      if @provider && @provider.authenticate(params[:login][:password])
        session[:provider] = @provider.id
        format.html { redirect_to "/provider"}
        format.json { render :show, status: :created, location: "/provider"}
      else
        format.html { redirect_to '/provider/new',   notice: 'Your email and/or password were incorrect. Get your life together and try again'}
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @provider = Provider.new(provider_params)
    respond_to do |format|
      if @provider.save
        session[:provider] = @provider.id
        format.html { redirect_to "/provider/#{session[:provder]}", notice: 'Your profile was successfully created.' }
          format.json { render :show, status: :created, location: "/provider"}
      else
        format.html { redirect_to '/provider/new', notice: @provider.errors.full_messages}
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    session[:provider] = nil
    redirect_to '/'
  end

  private
  def provider_params
    params.require(:provider).permit(:name, :email, :password, :password_confirmation, :about, :profile_pic)
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
  end
end
