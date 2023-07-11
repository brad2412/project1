class TheatersController < ApplicationController

  def index
    @theaters = Theater.all.order(created_at: :desc)
  end

  def show
    @theater = Theater.find(params[:id])
  end
end