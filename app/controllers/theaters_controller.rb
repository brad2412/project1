class TheatersController < ApplicationController

  def index
    @theaters = Theater.all.order(created_at: :desc)
  end

  def show
    @theater = Theater.find(params[:id])
  end

  def new

  end

  def create
    Theater.create(theater_params)
    redirect_to "/theaters"
  end



  private
  def theater_params
    params.permit(:name, :open, :review)
  end
end