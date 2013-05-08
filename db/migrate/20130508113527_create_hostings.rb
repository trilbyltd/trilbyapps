class CreateHostings < ActiveRecord::Migration
  def change
    create_table :hostings do |t|
      t.string :domain_name, :null => false
      t.string :hosting_package, :null => false
      t.boolean :domain_registration
      t.string :email, :null => false
      t.integer :customer_id, :null => false
      t.string :contact_name
      t.string :contact_email, :null => false
      t.text :additonal_domains
      t.text :notes

      t.timestamps
    end
  end
end
