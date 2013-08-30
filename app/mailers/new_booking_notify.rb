class NewBookingNotify < ActionMailer::Base
  default_url_options[:host] = "trilby.co.uk"
  default from: "noreply@trilby.co.uk"

  def send_new_booking_notification(booking)
  	@booking = booking
  	from      "Trilby Bookings <noreply@trilby.co.uk>"
        mail( :to => "@booking.trainer.email",
              :subject => "New Booking Confirmation",
              :from => from,
              :fail_to => from
            ) do |format|
          format.html
        end
    end
end


end
