class RemoveTypeAddNewColumn < ActiveRecord::Migration
  def self.up
  	rename_column :projectiles, :type,:ptype
  	
  end

  def self.down
  	rename_column :projectiles, :ptype, :type
  end
end
