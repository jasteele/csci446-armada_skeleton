class Role < ActiveRecord::Base
  
  has_paper_trail
  
  validates_length_of :name, :minimum => 1
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :users
  
  def after_initialize
    if new_record? 
    	self.name = name.downcase
    end
  end
end



# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)
#  users_count :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

