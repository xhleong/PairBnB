class ListingsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(params[:listing],user_id:current_user.id)

    if @listing.save
      redirect_to @listing
    else
      render 'new'
    end
  end

end
