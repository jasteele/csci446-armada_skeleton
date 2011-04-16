class Projectile < ActiveRecord::Base
  has_many :favorites
  belongs_to :user

  attr_accessible :name, :ptype, :cost, :description
  validates_presence_of :name, :ptype, :cost, :description
  validates_length_of :name, :minimum => 5
  validates_numericality_of :cost, :greater_than => 0
  

end
