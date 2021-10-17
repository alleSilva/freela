class ActuationAreasController < ApplicationController
  def show
    @actuation_area = ActuationArea.find(params[:id])
  end

  def new
    @actuation_area = ActuationArea.new
  end

  def create
    @actuation_area = ActuationArea.create!(params.require(:actuation_area).permit(:name))

    if @actuation_area.save
      redirect_to @actuation_area
    else
      render :new
    end
  end
end
