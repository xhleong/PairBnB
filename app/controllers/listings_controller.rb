class ListingsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @user = User.find(current_user.id)
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    if @listing.save
      redirect_to root_path
    else
      render 'new'
    end
  end


private
  def listing_params
    params[:listing].permit(:name, :property_type, :address, :city, :postcode, :state, :country, :room_number, :bed_number, :guest_number, :price, :user_id, amenities:[], tags:[])
  end
end
