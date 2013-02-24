class AddThumbnailToCourse < ActiveRecord::Migration
  def self.up
  	add_column :courses, :thumbnail, :string
  	add_column :courses, :retinathumbnail, :string
  end

  def self.down
  	remove_column :courses, :thumbnail
  	remove_column :courses, :retinathumbnail
	end
end
