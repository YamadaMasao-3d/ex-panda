class ExpendablesController < ApplicationController

  def index
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


  private

  def expendable_params
    params.require(:expendable).permit(:content, :image, :period, :name).merge(user_id: current_user.id)
  end

end
