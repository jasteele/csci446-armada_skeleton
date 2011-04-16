class AddCostToProjectiles < ActiveRecord::Migration
  def self.up
  	add_column :projectiles, :cost, :integer
  end

  def self.down
  	remove_column :projectiles, :cost
  end
end
