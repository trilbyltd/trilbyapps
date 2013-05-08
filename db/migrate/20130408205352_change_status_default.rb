class ChangeStatusDefault < ActiveRecord::Migration
  def self.up
  	change_column_default(:courses, :status, 'false')

  end

  def self.down
  end
end
