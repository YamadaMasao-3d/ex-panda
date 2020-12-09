class FavoritesController < ApplicationController

  def index
    if user_signed_in?
      @favorite = Favorite.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to root_path(@favorite.user_id)
    else
      render :index
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def edit
  end

  private

  def favorite_params
    params.require(:favorite).permit(:content, :image, :period, :name).merge(user_id: current_user.id)
  end

end