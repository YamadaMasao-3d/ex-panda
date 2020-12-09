class WantsController < ApplicationController

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
    @want = Want.find(params[:id])
  end

  def edit
  end

  private

  def want_params
    params.require(:want).permit(:content, :image, :name).merge(user_id: current_user.id)
  end

end
