class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :details
      t.string :thumbnail
      t.string :retinathumbnail
      t.string :video_file
      t.string :app_url
      t.string :app_thumbnail

      t.timestamps
    end
  end
end
