class Booking < ActiveRecord::Base
  attr_accessible :contact_email, :contact_name, :customer_id, :invoice_sent, :length, :purchase_order, :quote_id, :reseller_id, :training_approved, :training_confirmed, :training_date, :training_type
end
