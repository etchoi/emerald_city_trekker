class UserController < ApplicationController
  def index
    @user = User.new
  end

  def show
    if session[:user] == nil
      render json:'hello world'
    else
      @user = User.find(session[:user])
      @request = Request.joins(:tour).joins(:provider).where(user_id:session[:user])
      @scheduled = Scheduled.joins(:user).where(user_id:session[:user])
    end

  end

  def new
  end

  def edit
  end

  def user_login
    @user = User.find_by(email: params[:login][:email].downcase)
    respond_to do |format|
      if @user && @user.authenticate(params[:login][:password])
        session[:user] = @user.id
        format.html { redirect_to "/user/#{@user.id}"}
        format.json { render :show, status: :created, location: "/user/#{@user.id}"}
      else
        format.html { redirect_to '/',   notice: 'Your email and/or password were incorrect. Get your life together and try again'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user] = @user.id
        format.html { redirect_to "/user/#{session[:user]}", notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: "/provider"}
      else
        format.html { redirect_to '/user', notice: @user.errors.full_messages}
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
