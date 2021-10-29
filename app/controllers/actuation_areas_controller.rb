class ActuationAreasController < ApplicationController
  before_action :should_authenticate!

  def show
    @actuation_area = ActuationArea.find(params[:id])
  end

  def new
    @actuation_area = ActuationArea.new
  end

  def create
    @actuation_area = ActuationArea.new(params.require(:actuation_area).permit(:name))

    if @actuation_area.save
      redirect_to @actuation_area
    else
      render :new
    end
  end

  def should_authenticate!
    return if project_owner_signed_in?
  
    redirect_to root_path, alert: 'Faça login para ter acesso ao site'
  end
end
