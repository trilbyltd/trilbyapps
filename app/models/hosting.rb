class Hosting < ActiveRecord::Base
  attr_accessible :additional_domains, :contact_email, :contact_name, :customer_id, :domain_registration, :domain_name, :email, :hosting_package, :notes

  has_many :hosting_renewals

  scope :all, order('domain_name DESC')
  scope :renewals, order('renewal_date DESC'), where(:id => HostingRenewals.hosting_id)

  validates :contact_address, :format => { :with => /^([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4})?$/, :message => 'must be valid email.' }

  PACKAGE_TYPE = ["Trilby Small", "Trilby Medium", "Trilby Large", "Trilby XL", "Domain Only", "Domain and email"]
end
