class BoxesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_boxe, only: [:show, :edit, :update, :destroy]

  def index
    @boxes = policy_scope(Boxe).order(created_at: :desc)
    if params[:query].present?
      @boxes = Boxe.search_by_name_and_description(params[:query])
      @markers = @boxes.map do |boxe|
      {
        lat: boxe.latitude,
        lng: boxe.longitude,
        infoWindow: render_to_string(partial: "infoWindow", locals: { boxe: boxe })
      }
    end
    else
    @boxes = Boxe.where.not(latitude: nil, longitude: nil)
    @markers = @boxes.map do |boxe|
      {
        lat: boxe.latitude,
        lng: boxe.longitude,
        infoWindow: render_to_string(partial: "infoWindow", locals: { boxe: boxe })
      }
    end
  end
  end

  def new
    @boxe = Boxe.new
    authorize @boxe
  end

  def create
    @boxe = Boxe.new(boxe_params)

    @boxe.user = current_user
     authorize @boxe
    if @boxe.save
      redirect_to box_path(@boxe)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.new
    @review = Review.new
    authorize @boxe
  end

  def update
    @boxe.update(boxe_params)
    authorize @boxe
    redirect_to user_path(current_user)
  end

  def edit
    @boxe = Boxe.find(params[:id])
    authorize @boxe
  end

  def destroy
    @boxe = Boxe.find(params[:id])
    @boxe.destroy
    authorize @boxe
    redirect_to user_path(current_user)
  end

  private


  def set_boxe
    @boxe = Boxe.find(params[:id])
  end

  def boxe_params
    params.require(:boxe).permit(:name, :description, :caracteristics, :address, :price_per_day, :photo)
  end
end
