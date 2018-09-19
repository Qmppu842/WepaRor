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
    raiting.user = current_user
    raiting.save
    redirect_to current_user
  end

  def destroy
    raiting = Raiting.find(params[:id])
    raiting.delete
    redirect_to user_path(current_user)
  end

end
