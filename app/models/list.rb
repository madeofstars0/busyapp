class List < ActiveRecord::Base
  belongs_to :user
  has_many :action_items
  
  validates_presence_of :user_id
end
