class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_items
  
  validates_presence_of :user_id
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :user_id
  
end
