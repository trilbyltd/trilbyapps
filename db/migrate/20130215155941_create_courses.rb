class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title,              :null => :false
      t.text :audience,             :null => :false
      t.text :description,          :null => :false
      t.text :learning_outcomes
      t.text :equipment
      t.decimal :enduser_cost,      :null => :false
      t.decimal :contract_cost
      t.decimal :length,            :null => :false
      t.string :location
      t.string :category,           :null => :false

      t.timestamps
    end
  end
end
