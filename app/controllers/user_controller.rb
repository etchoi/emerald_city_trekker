class UserController < ApplicationController
  def index
    session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/user/index')
      if params[:code]
      # acknowledge code and get access token from FB
         session[:access_token] = session[:oauth].get_access_token(params[:code])
      end
      # auth established, now do a graph call:
      @api = Koala::Facebook::API.new(session[:access_token])
      # @graph_data = @api.get_object("/me/statuses", "fields"=>"message")
      begin
         @profile = @api.get_object("/me")
         @friends =  @api.get_object("/me/friends")
      end
      respond_to do |format|
         format.html {   }
      end

      # render json:@profile
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
