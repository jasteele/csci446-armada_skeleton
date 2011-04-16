class AddProjectileUserId < ActiveRecord::Migration
  def self.up
    add_column :projectiles, :user_id, :integer
  end

  def self.down
    remove_column :projectiles, :user_id
  end
end
