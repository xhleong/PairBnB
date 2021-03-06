class ReservationsController < ApplicationController
  
  before_action :require_login

  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = @listing.id
    @user = current_user
    @owner = User.find(@listing.user_id)


    if @reservation.save
      ReservationMailer.reservation_confirmation(@user, @owner, @listing, @reservation).deliver_later
      ReservationMailer.new_reservation(@owner, @user, @listing, @reservation).deliver_later
      redirect_to [@listing, @reservation]
    else
      render 'new'
    end

  end

  def show
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
  end

private
  def reservation_params
    params[:reservation].permit(:start_date, :end_date, :total_price, :user_id, :listing_id)
  end

end
