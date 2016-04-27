class UserController < ApplicationController
  def index
    # session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/user/index')
    #   if params[:code]
    #   # acknowledge code and get access token from FB
    #      session[:access_token] = session[:oauth].get_access_token(params[:code])
    #   end
    #   # auth established, now do a graph call:
      # @api = Koala::Facebook::API.new(session[:access_token])
    #   # @graph_data = @api.get_object("/me/statuses", "fields"=>"message")
    #   begin
    #      @profile = @api.get_object("/me")
    #      @friends =  @api.get_object("/me/friends")
    #   end
    #   respond_to do |format|
    #      format.html {   }
    #   end

    @user = User.new
  end

  def show
    @user = User.find(session[:user])
  end

  def new
  end

  def edit
  end

  def user_login
    @user = User.find_by(email: params[:login][:email].downcase)
    respond_to do |format|
      if @user && @user.authenticate(params[:login][:password])
        session[:active] = @user.id
        format.html { redirect_to "/user/#{@user.id}"}
        format.json { render :show, status: :created, location: "/user/#{@user.id}"}
      else
        format.html { redirect_to '/',   notice: 'Your email and/or password were incorrect. Get your life together and try again'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    # render json:params[:user][:profile_pic]
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user] = @user.id
        format.html { redirect_to "/user/#{session[:user]}", notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: "/provider"}
      else
        format.html { redirect_to '/user/new', notice: @user.errors.full_messages}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    session[:user] = nil
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :first_name, :city, :country, :email, :about, :password, :password_confirmation, :profile_pic)
  end
end
