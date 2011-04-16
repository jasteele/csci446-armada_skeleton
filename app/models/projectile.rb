class Projectile < ActiveRecord::Base
  has_many :favorites
  belongs_to :user
  has_many :users, :through => :favorites

  attr_accessible :name, :ptype, :cost, :description, :user
  validates_presence_of :name, :ptype, :cost, :description
  validates_length_of :name, :minimum => 5
  validates_numericality_of :cost, :greater_than => 0
  

end
