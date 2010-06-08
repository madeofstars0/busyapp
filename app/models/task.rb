class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :list
  belongs_to :context
  
  validates_presence_of :list_id, :context_id, :name, :status
  
  validates_inclusion_of :status, :in => %w(open finished),
      :message => "%{value} is not a valid status"
end
