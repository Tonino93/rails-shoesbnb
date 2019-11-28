class BookingsController < ApplicationController
  def create
    @booking = Booking.new(bookings_params)
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    @user = current_user
    @booking.user = @user
    @booking.total_price = booking_total_price
    offer = Offer.find(params[:offer_id])
    bookings = []
    bookings = Booking.where(offer: offer)
    if bookings == []
      raise
      @booking.save
      redirect_to dashboard_path
    else
      bookings.each do |booking|
        if ((@booking.start_date < booking.start_date && @booking.end_date < booking.start_date) || (@booking.start_date > booking.end_date && @booking.end_date > booking.end_date))
          @booking.save
          return redirect_to dashboard_path
        else
          flash[:notice] = "Ces dates sont déjà réservées"
          return redirect_to offer_path(offer)
        end
      end
    end
  end

  def booking_total_price
    if @booking.start_date != nil && @booking.end_date != nil
      @days = (@booking.end_date - @booking.start_date).to_i
      @booking.total_price = @days * @booking.offer.price_per_day
    end
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
