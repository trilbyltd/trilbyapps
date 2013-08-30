class Renewal < ActiveRecord::Base
  attr_accessible :invoice_sent, :paid, :renewal_date, :hosting_id

  belongs_to :domain

  # scope :all, order('renewal_date DESC')
  # scope :renewals, order('renewal_date DESC'), where(:hosting_id => @hosting.id)
end
