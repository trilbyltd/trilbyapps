class ChangeCostDecimal < ActiveRecord::Migration
  def up
  	change_table :courses do |t|
  		t.decimal :enduser_cost, 	:scale => 2, :precision => 2
  		t.decimal :contract_cost, 	:scale => 2, :precision => 2
 	end
  end

end
