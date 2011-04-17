class Projectile < ActiveRecord::Base
  has_many :favorites
  belongs_to :user
  has_many :users, :through => :favorites

  attr_accessible :name, :ptype, :cost, :description, :user, :photo
  validates_presence_of :name, :ptype, :cost, :description
  validates_length_of :name, :minimum => 5
  validates_numericality_of :cost, :greater_than => 0
  
  has_attached_file :photo, 
  					:styles => {:small => "150x150", :avatar => "100x100" },
  					:url => "/assets/:class/:attachment/:id/:style/:filename",
  					:default_url => "/images/pirate_canon.jpg"

  #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 4.megabytes
end
