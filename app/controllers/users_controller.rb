require 'pry'

class UsersController < ApplicationController
  before_action :logged_in?

  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def logged_in?
    redirect_to root_path unless session.include? :user_id
  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :height, :happiness, :nausea, :tickets, :admin)
  end

end
