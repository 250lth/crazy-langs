require "monetize"

I18n.config.available_locales = :en

bargain_price = Monetize.from_numeric(99, "USD")
p bargain_price.format

standard_price = 100.to_money("USD")
p standard_price.format