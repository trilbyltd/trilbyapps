class Booking < ActiveRecord::Base
  validates :training_date, :training_type, :contact_name, :presence => true

  #belongs_to :reseller
  #attr_accessor :new_reseller_name
  #before_save :create_reseller_from_name

  def create_reseller_from_name
  #  create_reseller(:name => new_reseller_name) unless new_reseller_name.blank?
  end

  # Scopes for Index page
  scope :all, order("training_date ASC")
  scope :approved, -> { where(:training_approved => true) }
  scope :not_approved, -> { where(:training_approved => false) }
  scope :invoice_ready, -> { where("training_date <= ?", Time.zone.now) }
  scope :not_invoice_ready, -> { where("training_date > ?", Time.zone.now) }
  scope :not_sent, -> { where(:invoice_sent => false) }
  scope :not_confirmed, :conditions => { :training_confirmed => false }

FILTERS = [
  {:scope => "all",           :label => "All"},
  {:scope => "approved",      :label => "Approved"},
  {:scope => "not_approved",  :label => "Not Approved"},
  {:scope => "not_confirmed", :label => "Not Comfirmed"},
  {:scope => "invoice_ready", :label => "Ready to Invoice"},
]

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
