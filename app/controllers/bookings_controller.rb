class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @slot = ListingSlot.find(params[:listing_slot_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.listing_slot = ListingSlot.find(params[:listing_slot_id])
    # listing_slot_id is being stored in two places, once from selection and once from params - need to fix
    @booking.user = User.find_by(email: current_user.email)

    if @booking.save
      redirect_to listings_url, notice: "Booking was successfully created."
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:listing_slot)
  end
end
