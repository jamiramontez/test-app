class StackItem < ActiveRecord::Base
  attr_accessible :id, :item_name
  validates_presence_of :item_name
end
