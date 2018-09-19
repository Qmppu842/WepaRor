class RaitingsController < ApplicationController
  def index
    @raitings = Raiting.all
  end

  def new
    @raiting = Raiting.new
    @beers = Beer.all
  end

  def create
    @raiting = Raiting.create params.require(:raiting).permit(:score, :beer_id)
    @raiting.user = current_user

    if @raiting.save
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end

  def destroy
    raiting = Raiting.find(params[:id])
    raiting.delete if current_user == raiting.user
    redirect_to user_path(current_user)
  end

end
