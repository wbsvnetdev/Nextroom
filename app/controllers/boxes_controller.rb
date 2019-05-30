class BoxesController < ApplicationController
  before_action :set_boxe, only: [:show, :edit, :update, :destroy]
  def index
    @boxes = Boxe.where.not(latitude: nil, longitude: nil)
    @markers = @boxes.map do |boxe|
      {
        lat: boxe.latitude,
        lng: boxe.longitude,
        infoWindow: render_to_string(partial: "infoWindow", locals: { boxe: boxe })
      }
    end
  end

  def new
    @boxe = Boxe.new
  end

  def create
    @boxe = Boxe.new(boxe_params)
    if @boxe.save
      redirect_to box_path(@boxe)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.new
  end

  def update
    @boxe.update(boxe_params)
  end

  def edit
  end

  def destroy
    @boxe.delete
    redirect_to boxes_path
  end

  private

  def set_boxe
    @boxe = Boxe.find(params[:id])
  end

  def boxe_params
    params.require(:boxe).permit(:name, :description, :caracteristics, :address, :price_per_day)
  end
end
