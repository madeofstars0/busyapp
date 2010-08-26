class ActionItemsController < ApplicationController
  
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

  # GET /action_items/1
  # GET /action_items/1.xml
  def show
    @action_item = ActionItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_item }
    end
  end

  # GET /action_items/new
  # GET /action_items/new.xml
  def new
    @action_item = ActionItem.new
    @list = List.find(params[:list_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_item }
    end
  end

  # GET /action_items/1/edit
  def edit
    @action_item = ActionItem.find(params[:id])
    @list = List.find(params[:list_id])
  end

  # POST /action_items
  # POST /action_items.xml
  def create
    @action_item = ActionItem.new(params[:action_item])
    @action_item.list_id = params[:list_id]
    @action_item.user = current_user

    respond_to do |format|
      if @action_item.save
        format.html { redirect_to(@action_item.list, :notice => 'Action item was successfully created.') }
        format.xml  { render :xml => @action_item, :status => :created, :location => @action_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_items/1
  # PUT /action_items/1.xml
  def update
    @action_item = ActionItem.find(params[:id])

    respond_to do |format|
      if @action_item.update_attributes(params[:action_item])
        format.html { redirect_to(@action_item, :notice => 'Action item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_items/1
  # DELETE /action_items/1.xml
  def destroy
    @action_item = ActionItem.find(params[:id])
    @action_item.destroy

    respond_to do |format|
      format.html { redirect_to(list_url(params[:list_id])) }
      format.xml  { head :ok }
    end
  end
end
