class RenameHostingRenewalToRenewal < ActiveRecord::Migration
  def up
    rename_table :hosting_renewals, :renewals
  end

  def down
    rename_table :renewals, :hosting_renewals
  end
end
