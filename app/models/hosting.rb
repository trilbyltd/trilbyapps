class Hosting < ActiveRecord::Base
  attr_accessible :additional_domains, :contact_email, :contact_name, :customer_id, :domain_registration, :domain_name, :email, :hosting_package, :notes

scope :all, order("domain_name ASC")
end
