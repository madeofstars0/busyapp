class ActionItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  
  validates_presence_of :list_id
  validates_presence_of :user_id
  validates_presence_of :name
  
  def mark_complete
    is_complete = true
    completed_at = DateTime.now
  end
end
