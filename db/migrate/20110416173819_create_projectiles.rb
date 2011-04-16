class CreateProjectiles < ActiveRecord::Migration
  def self.up
    create_table :projectiles do |t|
      t.string :name
      t.string :type
      t.int :cost
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :projectiles
  end
end
