class ListingsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @listings = Listing.order(updated_at: :desc).page(params[:page]).per(12)
  end

  def new
    @user = User.find(current_user.id)
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    if @listing.save
      redirect_to @listing
    else
      render 'new'
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end

  def destroy

    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to listing_path

  end


private
  def listing_params
    params[:listing].permit(:name, :property_type, :address, :city, :postcode, :state, :country, :room_number, :bed_number, :guest_number, :price, :user_id, amenities:[], tags:[], gallery:{})
  end
end
