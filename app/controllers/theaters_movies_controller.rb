class TheatersMoviesController < ApplicationController
  def index
    @theater = Theater.find(params[:theater_id])
    @movies = @theater.movies
  end
end