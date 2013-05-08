class AddReleaseDateToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :release_date, :date
    add_column :courses, :status, :boolean
  end
end
