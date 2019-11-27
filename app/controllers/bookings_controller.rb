class BookingsController < ApplicationController
  def create
    @booking = Booking.new(bookings_params)
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    @user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to dashboard_path
    else
      render "offers/show"
    end
  end

  def destroy
    @booking.destroy
    redirect_to offers_path
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
