class ChangeColumnAdditonalDomains < ActiveRecord::Migration
  def change
  	rename_column :hostings, :additonal_domains, :additional_domains
  end

end
