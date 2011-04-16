class Favorite < ActiveRecord::Base
  belongs_to :projectile
  belongs_to :user
end
