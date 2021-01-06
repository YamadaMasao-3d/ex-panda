class FavoritesController < ApplicationController
  before_action :item_find, only: [:show, :update, :edit, :destroy, :day_update]

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
  end

  def edit
  end

  def update
    if @favorite.update(favorite_params)
      redirect_to root_path(@favorite.user_id)
    else
      render :edit
    end
  end

  def day_update
    if @favorite.update(registration_day: Date.today)
      redirect_to root_path(@favorite.user_id)
    else
      render :index
    end
  end

  def destroy
    if @favorite.destroy
      redirect_to root_path
    else
      redirect_to favorite_path(@favorite.id)
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:content, :image, :period, :name).merge(user_id: current_user.id,
                                                                             registration_day: Date.today)
  end

  def item_find
    @favorite = Favorite.find(params[:id])
  end
end
