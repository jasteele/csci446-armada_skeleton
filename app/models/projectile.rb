class Projectile < ActiveRecord::Base
  attr_accessible :name, :ptype, :cost, :description
  has_many :favorites
  belongs_to :user
end
