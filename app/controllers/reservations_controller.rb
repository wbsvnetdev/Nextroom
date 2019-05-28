class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @reservation = Reservation.new
  end

  def create
    @boxe = Boxe.find(params[:box_id])
    # @reservation = Reservation.new(reservation_params)
    # @reservation.user = current_user
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.total_price = @boxe.price_per_day
    @reservation.boxe = @boxe
    if @reservation.save!
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
    raise
  end

  def show
    @reservation = Reservation.all
  end

  def destroy
  end

  def index
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price)
  end
end
