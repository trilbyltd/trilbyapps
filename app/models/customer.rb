class Customer < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true
  
  scope :all, order("id desc")
end
