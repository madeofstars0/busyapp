class ListItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  
  validates_presence_of :list_id
  validates_presence_of :user_id
  validates_presence_of :name
  
  def mark_complete
    is_complete = true
    completed_at = DateTime.now
  end
  
  # TODO: if due_date and description is blank, try to parse due date from name
  # we only want the parsing on quick-input, not when due-date was intentionally not
  # filled out
  
  
  
  before_validation(:on => :create) do
    # Try to parse the due date from the name if due_date and description are blank
    if !due_date && !description
      if name.sub("due")
        
      end
      # TODO: Task Name due tomorrow
      # TODO: Task Name due 8/17
      # TODO: Task Name due 9-12
      # TODO: Task Name due 2010-09-09
      # TODO: Task Name due (next) monday
      # TODO: Fix problem due to misaligned feature (negative example)
    end
  end
  
end
