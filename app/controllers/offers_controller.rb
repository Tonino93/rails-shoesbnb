class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  def index
    @offers = Offer.all
    @offers_geo = Offer.geocoded #returns flats with coordinates
    @markers = @offers_geo.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        infoWindow: render_to_string(partial: "flats/info_window", locals: { offer: offer }),
        image_url: helpers.asset_url('shoesbnb.png')
      }
    end
  end

  def show
    user_signed_in?
    @booking = Booking.new
  end

  def new
    user_signed_in?
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offers_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @offer.update(offers_params)
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offers_params
    params.require(:offer).permit(:name, :brand, :description, :category, :size, :color, :price_per_day, :address, :photo)
  end
end
