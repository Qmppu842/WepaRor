class RaitingsController < ApplicationController
  def index
    @raitings = Raiting.all
  end

  def new
    @raiting = Raiting.new
    @beers = Beer.all
  end

  def create
    raiting = Raiting.create params.require(:raiting).permit(:score, :beer_id)

    session[:last_raiting] = "#{raiting.beer.name} #{raiting.score} points"

    redirect_to raitings_path
  end

  def destroy
    raiting = Raiting.find(params[:id])
    raiting.delete
    redirect_to raitings_path
  end

end
