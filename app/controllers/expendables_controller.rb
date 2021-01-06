class ExpendablesController < ApplicationController
  before_action :item_find, only: [:show, :update, :edit, :destroy, :day_update]

  def index
    user = User.find(current_user.id)
    @want = Want.where(user_id: user.id).order('created_at DESC')
    @favorite = favorite_expiration.sort_by!{ |a| a["expiration"] }
    @expendable = expendable_expiration.sort_by!{ |a| a["expiration"] }
  end

  def new
    if user_signed_in?
      @expendable = Expendable.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @expendable = Expendable.new(expendable_params)
    if @expendable.save
      redirect_to root_path(@expendable.user_id)
    else
      render :new
    end
  end

  def show
    @expendable = Expendable.find(params[:id])
  end

  def edit
    
  end

  def update
    if @expendable.update(expendable_params)
      redirect_to root_path(@expendable.user_id)
    else
      render :edit
    end
  end

  def day_update
    if @expendable.update(registration_day: Date.today)
      redirect_to root_path(@expendable.user_id)
    else
      render :index
    end
  end
     

  def destroy
    if @expendable.destroy
      redirect_to root_path
    else
      redirect_to expendable_path(@expendable.id)
    end
  end


  private

  def expendable_params
    params.require(:expendable).permit(:content, :image, :period, :name).merge(user_id: current_user.id, registration_day: Date.today)
  end

  def item_find
    @expendable = Expendable.find(params[:id])
  end

  def favorite_expiration
    user = User.find(current_user.id)
    favorites = Favorite.where(user_id: user.id)
    @favorite = []
    favorites.each do |favorite|
      favorite = {"id" => favorite.id, "name" => favorite.name, "content" => favorite.content, "period" => favorite.period, "image" => favorite.image, "registration_day" => favorite.registration_day, "user_id" => favorite.user_id, "expiration" => (favorite.registration_day.day + favorite.period - Date.today.day)}
      @favorite << favorite
    end
    @favorite
  end

  def expendable_expiration
    user = User.find(current_user.id)
    expendables = Expendable.where(user_id: user.id)
    @expendable = []
    expendables.each do |expendable|
      expendable = {"id" => expendable.id, "name" => expendable.name, "content" => expendable.content, "period" => expendable.period, "image" => expendable.image, "registration_day" => expendable.registration_day, "user_id" => expendable.user_id, "expiration" => (expendable.registration_day.day + expendable.period - Date.today.day)}
      @expendable << expendable
    end
    @expendable
  end

end
