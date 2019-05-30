class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @reservation = Reservation.new
  end

  def create
    @boxe = Boxe.find(params[:box_id])
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.total_price = @boxe.price_per_day
    @reservation.boxe = @boxe
    authorize @reservation
    if @reservation.save!
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.all
    authorize @reservation
  end

  def destroy
    authorize @reservation
  end

  def index
    @reservation = policy_scope(Reservation).order(created_at: :desc)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price)
  end
end
