class ChangeDescriptionToText < ActiveRecord::Migration
  def self.up
  	  remove_column :projectiles, :description
  	  add_column :projectiles, :description, :text
  end

  def self.down
  	  remove_column :projectiles, :description
  	  add_column :projectiles, :description, :string
  end
end
