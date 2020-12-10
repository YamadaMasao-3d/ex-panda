class WantsController < ApplicationController
  before_action :item_find, only: [:show, :update, :edit, :destroy]

  def index
    if user_signed_in?
      @want = Want.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @want = Want.new(want_params)
    if @want.save
      redirect_to root_path(@want.user_id)
    else
      render :index
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @want.update(item_data_params)
      redirect_to root_path(@want.id)
    else
      render :edit
    end
  end

  def destroy
    if @want.destroy
      redirect_to root_path
    else
      redirect_to want_path(@want.id)
    end
  end

  private

  def want_params
    params.require(:want).permit(:content, :image, :name).merge(user_id: current_user.id)
  end

  def item_find
    @want = Want.find(params[:id])
  end

  def item_data_params
    params.require(:want).permit(:image, :name, :content)
  end

end
