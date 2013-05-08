class Course < ActiveRecord::Base
  attr_accessible :audience, :category, :contract_cost, :description, :enduser_cost, :equipment, :learning_outcomes, :length, :location, :title, :thumbnail, :retinathumbnail, :status

  mount_uploader :thumbnail, ImageUploader
  mount_uploader :retinathumbnail, ImageUploader

  validates :title, :category, :audience, :description, :enduser_cost, :length, :presence => true
  # validates :enduser_cost, :contract_cost, :precision => 2

  scope :all, order("title ASC")
  scope :active, :conditions => {:status => true}
  scope :apd, 			:conditions => {:category => "APD"}
  scope :intro, 		:conditions => {:category => "Intro"}
  scope :creative, 		:conditions => {:category => "Creative"}
  scope :technology, 	:conditions => {:category => "Technology"}
  scope :vision, 		:conditions => {:category => "Vision"}
  
end
