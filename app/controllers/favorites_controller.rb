class FavoritesController < ApplicationController
  before_action :item_find, only: [:show, :update, :edit, :destroy]

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

  def update
    if @favorite.update(item_data_params)
      redirect_to root_path(@favorite.user_id)
    else
      render :edit
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:content, :image, :period, :name).merge(user_id: current_user.id)
  end

  def item_find
    @favorite = Favorite.find(params[:id])
  end

  def item_data_params
    params.require(:favorite).permit(:image, :name, :period, :content)
  end

end