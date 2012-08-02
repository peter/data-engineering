class Purchase < ActiveRecord::Base
  attr_accessible :item, :purchaser, :merchant, :purchase_file, :item_count, :item_price_in_cents

  belongs_to :item
  belongs_to :purchaser
  belongs_to :merchant
  belongs_to :purchase_file, dependent: :destroy

  validates :item_id, presence: true
  validates :purchaser_id, presence: true
  validates :merchant_id, presence: true
  validates :purchase_file_id, presence: true
  validates :item_count, presence: true
  validates :item_price_in_cents, presence: true

  before_validation :set_total_price_in_cents

  private

  def set_total_price_in_cents
    if item_price_in_cents.present? && item_count.present?
      self.total_price_in_cents = item_price_in_cents * item_count
    end
  end
end
