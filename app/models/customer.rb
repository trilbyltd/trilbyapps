class Customer < ActiveRecord::Base
  validates :name, :presence => true
  scope :all, order("id desc")
end
