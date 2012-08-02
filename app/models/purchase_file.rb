class PurchaseFile < ActiveRecord::Base
  attr_accessible :contents, :name
  serialize :processing_errors

  validates :name, presence: true
  validates :contents, presence: true
end
