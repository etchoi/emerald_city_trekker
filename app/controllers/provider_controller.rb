class ProviderController < ApplicationController
  def index
    @providers = Provider.find(session[:provider])
  end

  def show
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)
    respond_to do |format|
      if @provider.save
        session[:provider] = @provider.id
        format.html { redirect_to "/provider/#{session[:provder]}", notice: 'User was successfully created.' }
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
  end

  private
  def provider_params
    params.require(:provider).permit(:name, :email, :password, :password_confirmation, :about, :profile_pic)
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
  end
end
