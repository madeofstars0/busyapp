# Copyright 2010 Bryan Rehbein
# 
# Filename: list_items_controller.rb
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class ListItemsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /list_items/1
  # GET /list_items/1.xml
  def show
    @list_item = current_user.list_items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list_item }
    end
  end

  # GET /list_items/new
  # GET /list_items/new.xml
  def new
    @list_item = ListItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list_item }
    end
  end

  # GET /list_items/1/edit
  def edit
    @list_item = current_user.list_items.find(params[:id])
  end

  # POST /list_items
  # POST /list_items.xml
  def create
    @list_item = ListItem.new(params[:list_item])
    @list_item.user = current_user

    respond_to do |format|
      if @list_item.save
        format.html { redirect_to(@list_item.list, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @list_item, :status => :created, :location => @list_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /list_items/1
  # PUT /list_items/1.xml
  def update
    @list_item = current_user.list_items.find(params[:id])

    respond_to do |format|
      if @list_item.update_attributes(params[:list_item])
        format.html { redirect_to(@list_item.list, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list_item.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # POST list_items/18867/complete
  def complete
    @list_item = current_user.list_items.find(params[:id])
    
    @list_item.is_complete = true
    @list_item.completed_at = DateTime.now
    
    respond_to do |format|
      if @list_item.save
        format.html { redirect_to(@list_item.list, :notice => 'Item was successfully completed.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1
  # DELETE /list_items/1.xml
  def destroy
    @list_item = current_user.list_items.find(params[:id])
    @list_item.destroy

    respond_to do |format|
      format.html { redirect_to(list_url(@list_item.list_id)) }
      format.xml  { head :ok }
    end
  end
end
