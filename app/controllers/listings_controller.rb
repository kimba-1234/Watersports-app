class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]

  def index
    @listings = Listing.all
    @user = current_user
  end

  def show
    @booking = Booking.new
  end

  def new
    @listing = Listing.new
    @user = current_user
  end

  def create
    @listing = Listing.new(listing_params)
    @user = current_user
    @listing.user = @user

    if @listing.save
      redirect_to @listing, notice: "Listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(email: current_user.email)
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Listing was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_url, notice: "Listing was successfully destroyed.", status: :see_other
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  #added image
  def listing_params
    params.require(:listing).permit(:title, :description, :vendor, :location, :duration, :image, :price)
  end
end
