class Projectile < ActiveRecord::Base
  has_many :favorites
  belongs_to :user
  has_many :users, :through => :favorites

  #attr_accessible :name, :ptype, :cost, :description, :user, :photo, :attachment
  validates_presence_of :name, :ptype, :cost, :description
  validates_length_of :name, :minimum => 5
  validates_numericality_of :cost, :greater_than => 0
  
  has_attached_file :photo,
                    :styles => {
                      :thumb => ["100x100#"],
                      :medium => ["300x300#"]
                    },
                    :default_url => '/images/pirate_canon.jpg',
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "cs446/elephants/#{Rails.env}/:attachment/:id/:style.:extension"

  validates_attachment_size :photo, :less_than => 4.megabytes

end
