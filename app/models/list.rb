# Copyright 2010 Bryan Rehbein
# 
# Filename: list.rb
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

class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_items, :dependent => :destroy
  
  validates_presence_of :user_id
  validates_uniqueness_of :name, :scope => :user_id
  
  validates :name, :presence => true, :length => { :within => 1..40 }
  validates :description, :length => { :maximum => 255 }
end
