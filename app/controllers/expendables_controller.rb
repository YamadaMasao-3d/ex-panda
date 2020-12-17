class ExpendablesController < ApplicationController
  before_action :item_find, only: [:show, :update, :edit, :destroy, :day_update]

  def index
    @want = Want.includes(:user).order('created_at DESC')
    @favorite = favorite_expiration.sort_by!{ |a| a["expiration"] }
    @expendable = Expendable.includes(:user).order('created_at DESC')
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
    favorites = Favorite.includes(:user)
    @favorite = []
    favorites.each do |favorite|
      favorite = {"id" => favorite.id, "name" => favorite.name, "content" => favorite.content, "period" => favorite.period, "image" => favorite.image, "registration_day" => favorite.registration_day, "user_id" => favorite.user_id, "expiration" => (favorite.registration_day.day + favorite.period - Date.today.day)}
      @favorite << favorite
    end
    @favorite
  end

end
