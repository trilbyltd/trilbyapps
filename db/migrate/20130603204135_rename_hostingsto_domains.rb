class RenameHostingstoDomains < ActiveRecord::Migration
  def up
  	rename_table :hostings, :domains
  end

  def down
  	rename_table :domains, :hostings
  end
end
