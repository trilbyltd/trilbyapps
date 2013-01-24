class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :reseller_id
      t.integer :customer_id
      t.string :contact_name
      t.string :contact_email
      t.datetime :training_date
      t.string :training_type
      t.decimal :length
      t.integer :quote_id
      t.string :purchase_order
      t.boolean :training_confirmed
      t.boolean :invoice_sent
      t.boolean :training_approved

      t.timestamps
    end
  end
end
