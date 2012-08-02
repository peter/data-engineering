require 'csv'

class PurchaseFileParser
  attr_accessor :contents

  def initialize(contents)
    self.contents = contents
  end

  def rows
    rows = []
    CSV.parse(contents, csv_options) do |row|
      rows << row_hash(row)
    end
    rows
  end

  private

  def csv_options
    {
      headers: true,
      col_sep: "\t"
    }
  end

  def headers
    ['purchaser name', 'item description', 'item price', 'purchase count', 'merchant address', 'merchant name']
  end

  def key(header)
    header.gsub(/\s/, '_').to_sym
  end

  def row_hash(row)
    headers.inject({}) do |hash, header|
      hash[key(header)] = row.field(header)
      hash
    end
  end
end
