class UserController < ApplicationController

  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @User = User.find(params[:id])
    @tweets = @user.tweets
  end
end
