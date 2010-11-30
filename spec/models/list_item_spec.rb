require 'spec_helper'

describe ListItem do
  before(:each) do
    @li = ListItem.new
  end
  it "should be invalid without a name attribute" do
    @li.description = "test"
    @li.should_not be_valid
    @li.name = "Testing 123"
    @li.user_id = 1
    @li.list_id = 1
    @li.should be_valid
  end

  it "should have due_today? return true when the due_date is today" do
    @li.name = "Testing 123"
    @li.due_date = Date.today
    @li.user_id = 1
    @li.list_id = 1
    @li.due_today?.should eq(true)
  end

  it "should have overdue? return true when the due_date is in the past" do
    @li.name = "Testing 123"
    @li.due_date = Date.today - 1
    @li.user_id = 1
    @li.list_id = 1
    @li.overdue?.should eq(true)
  end
  #pending "validate shorthand due date in ListItem.name on create"
end
