class Projectile < ActiveRecord::Base
  attr_accessible :name, :ptype, :cost, :description
  has_many :favorites
  has_many :users, :through => :favorites
end
