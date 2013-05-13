class AddHostingIdToHostingRenewals < ActiveRecord::Migration
  def change
  	 add_column :hosting_renewals, :hosting_id, :integer
  end
end
