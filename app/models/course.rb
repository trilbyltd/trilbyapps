class Course < ActiveRecord::Base
  attr_accessible :audience, :category, :contract_cost, :description, :enduser_cost, :equipment, :learning_outcomes, :length, :location, :title

  validates :title, :category, :audience, :description, :enduser_cost, :length, :presence => true
  # validates :enduser_cost, :contract_cost, :precision => 2

  scope :apd, 			:conditions => {:category => "apd"}
  scope :intro, 		:conditions => {:category => "intro"}
  scope :creative, 		:conditions => {:category => "creative"}
  scope :technology, 	:conditions => {:category => "technology"}
  scope :vision, 		:conditions => {:category => "vision"}
  
end
