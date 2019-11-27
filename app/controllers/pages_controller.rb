class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @mybookings = current_user.bookings
    @offers = current_user.offers
    @bookings = Booking.where(offer: Offer.where(user: current_user))
  end
end
