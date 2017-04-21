module MoneyViewUtils
  extend ActionView::Helpers::NumberHelper

  module_function

  # Converts instance of Money to properly formatted and localized string for view purposes
  # Replaces spaces with narrow non breaking spaces, we do not want monetary amounts to be split on separate lines
  def to_humanized(m, locale)
    separator = I18n.t("number.currency.format.separator", locale: locale)
    number_to_currency(m.amount, unit: m.symbol, locale: locale)
      .tr(" ", "\u202F")
      .gsub("#{separator}00", "") # remove cents if they are zero
      .encode('utf-8')
  end
end
