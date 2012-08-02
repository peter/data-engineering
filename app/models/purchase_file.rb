class PurchaseFile < ActiveRecord::Base
  attr_accessible :contents, :name, :processing_errors
end
