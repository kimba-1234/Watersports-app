class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:create]

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
    @listingslot = ListingSlot.find(params[:listing_slot_id])
    @listingslot.booked = true
    @listingslot.save!
    @booking.listing_slot = @listingslot
    # listing_slot_id is being stored in two places, once from selection and once from params - need to fix
    @booking.user = User.find_by(email: current_user.email)

    if @booking.save
      redirect_to booking_url(@booking), notice: "Booking was successfully created."
    else
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
