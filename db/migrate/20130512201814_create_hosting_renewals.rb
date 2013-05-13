class CreateHostingRenewals < ActiveRecord::Migration
  def change
    create_table :hosting_renewals do |t|
      t.date :renewal_date
      t.date :invoice_sent
      t.boolean :paid

      t.timestamps
    end
  end
end
