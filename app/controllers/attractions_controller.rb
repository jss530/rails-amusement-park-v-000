class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show]


  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      @message = "Attraction was successfully created"
      redirect_to attraction_path(@attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    @message = "Attraction was successfully updated."
    redirect_to @attraction
  end


    def destroy
    @attraction.destroy
    @message = "Attraction was successfully destroyed."
    redirect_to attractions_path
  end

  def show

  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def set_user
    @user = User.find(session[:user_id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nauseat_rating, :happiness_rating, :min_height)
  end
end
