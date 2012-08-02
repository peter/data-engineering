class Money
  def initialize(args)
    args.assert_valid_keys(:cents, :amount)
    if args[:cents].present? && !args[:amount].present?
      @cents = args[:cents]
    elsif args[:amount].present? && !args[:cents].present?
      @cents = amount_to_cents(args[:amount])
    else
      raise ArgumentError, "Please specify either cents or amount (but not both)"
    end
  end

  def cents
    @cents
  end

  def amount
    (cents.to_i/100.0).round(2)
  end

  def to_s
    amount.to_s
  end

  private

  def amount_to_cents(amount)
    (amount.to_f*100).round
  end
end
