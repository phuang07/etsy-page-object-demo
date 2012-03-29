class EtsyHomePage
  include PageObject
  
  expected_title "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"
  direct_url BASE_URL
  link :buy, :text => "Buy"

end
