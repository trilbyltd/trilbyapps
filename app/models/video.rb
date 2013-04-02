class Video < ActiveRecord::Base
  attr_accessible :app_thumbnail, :app_url, :details, :retinathumbnail, :thumbnail, :title, :video_file, :thumbnail_cache, :retinathumbnail_cache

  scope :all, order("id desc")

  mount_uploader :thumbnail, ImageUploader
  mount_uploader :retinathumbnail, ImageUploader
  mount_uploader :video_file, VideoUploader

end
