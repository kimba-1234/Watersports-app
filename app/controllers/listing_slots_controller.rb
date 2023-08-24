class ListingSlotsController < ApplicationController
  def index
    @listing_slots = ListingSlot.all
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
