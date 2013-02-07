class CreateResellers < ActiveRecord::Migration
  def change
    create_table :resellers do |t|
      t.string :name

      t.timestamps
    end
  end
end
