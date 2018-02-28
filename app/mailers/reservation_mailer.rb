class ReservationMailer < ApplicationMailer
    default from: "booking@test.com"

    def reservation_confirmation(user, owner, listing,reservation)
      @user = user
      @owner = owner
      @listing = listing
      @reservation = reservation
      mail(to: @user.email, subject: 'Thank you for booking with us')
    end

    def new_reservation(owner, user, listing, reservation)
      @user = user
      @owner = owner
      @listing = listing
      @reservation = reservation
      mail(to: @owner.email, subject: 'You have a reservation')
    end

end
