class CalendarsController < ApplicationController
  before_filter :authenticate_user!
  
  
  # GET /action_items
  # GET /action_items.xml
  def index
    @action_items = ActionItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_items }
    end
  end
end
