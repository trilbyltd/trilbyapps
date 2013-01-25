class Booking < ActiveRecord::Base
  attr_accessible :contact_email, :contact_name, :customer_id, :invoice_sent, :length, :purchase_order, :quote_id, :reseller_id, :training_approved, :training_confirmed, :training_date, :training_type

# Convert to iCalendar
def to_ics
  booking = Icalendar::Event.new
  booking.start = self.training_date.strftime("%Y%m%dT%H%M%S")
  # booking.end = self.end_date.strftime("%Y%m%dT%H%M%S")
  booking.summary = self.training_type
  # booking.description = self.summary
  # booking.location = 'Here !'
  booking.klass = "PUBLIC"
  booking.created = self.created_at
  booking.last_modified = self.updated_at
  # booking.uid = booking.url = "#{PUBLIC_URL}bookings/#{self.id}"
  # booking.add_comment("AF83 - Shake your digital, we do WowWare")
  booking
end


end
