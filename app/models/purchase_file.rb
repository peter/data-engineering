class PurchaseFile < ActiveRecord::Base
  attr_accessible :contents, :name
  serialize :processing_errors

  has_many :purchases

  validates :name, presence: true
  validates :contents, presence: true

  after_create :process_purchases!

  def total_gross_revenue
    Money.new(cents: purchases.sum(:total_price_in_cents))
  end

  private

  def process_purchases!
    PurchaseFileProcessor.new(self).process!
  end
end
