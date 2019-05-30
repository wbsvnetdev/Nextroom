class BoxesController < ApplicationController
  before_action :set_boxe, only: [:show, :edit, :update, :destroy]

  def index
    @boxes = policy_scope(Boxe).order(created_at: :desc)
  end

  def new
    @boxe = Boxe.new
    authorize @boxe
  end

  def create
    @boxe = Boxe.new(boxe_params)
    authorize @boxe
    if @boxe.save
      redirect_to box_path(@boxe)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.new
    authorize @boxe
  end

  def update
    @boxe.update(boxe_params)
    authorize @boxe
  end

  def edit
  end

  def destroy
    @boxe.delete
    authorize @boxe
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
