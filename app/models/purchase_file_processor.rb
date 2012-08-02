class PurchaseFileProcessor
  attr_accessor :purchase_file

  def initialize(purchase_file)
    self.purchase_file = purchase_file
  end

  def process!
    errors = []
    PurchaseFileParser.new(purchase_file.contents).rows.each_with_index do |row, i|
      begin
        process_row!(row)
      rescue ActiveRecord::RecordInvalid => exception
        line = i+1
        log_exception(row, line, exception)
        errors << {line: line, exception: exception.message}
      end
    end
    if errors.present?
      purchase_file.processing_errors = errors
      purchase_file.save!
    end
  end

  private

  def process_row!(row)
    item = Item.find_by_description(row[:item_description]) || Item.create!(description: row[:item_description])
    purchaser = Purchaser.find_by_name(row[:purchaser_name]) || Purchaser.create!(name: row[:purchaser_name])
    merchant = Merchant.find_by_name(row[:merchant_name]) || Merchant.create!(address: row[:merchant_address], name: row[:merchant_name])
    Purchase.create!(
     item: item,
     purchaser: purchaser,
     merchant: merchant,
     purchase_file: purchase_file,
     item_count: row[:purchase_count],
     item_price_in_cents: Money.new(amount: row[:item_price]).cents
    )
  end

  def log_exception(row, line, exception)
    Rails.logger.error("#{self.class.name}: could not create valid purchase for line #{line}: " +
                       "'#{row.inspect}' - #{exception} #{exception.backtrace.join("\n")}")
  end
end
