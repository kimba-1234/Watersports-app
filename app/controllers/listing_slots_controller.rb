class ListingSlotsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :index, :show]

  def index
    @listing_slots = ListingSlot.all
    @clientbookings = Booking.where(user: current_user)
    @client_slots = @clientbookings.map { |booking| booking.listing_slot }
    #vendor below
    @vendor_listings = Listing.where(user: current_user)
    # above this line works so far
    @vendor_slots_all = []
    @vendor_listings.each { |listing| listing.listing_slots.each { |slot| @vendor_slots_all << slot } }
    @vendor_slots = []
    @vendor_slots_all.each do |slot|
      if slot.booked == true
        @vendor_slots << slot
      end
    end
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @listing_slot = ListingSlot.new
  end

  def create
    @listing_slot = ListingSlot.new(listing_slot_params)
    @listing = Listing.find(params[:listing_id])
    @listing_slot.listing = @listing

    if @listing_slot.save
      redirect_to @listing, notice: "Slot was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_slot_params
    params.require(:listing_slot).permit(:start_time, :end_time)
  end
end
