class Item < ActiveRecord::Base
  attr_accessible :description

  validates :description, presence: true, uniqueness: true
end
