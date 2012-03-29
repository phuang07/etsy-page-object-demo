class EtsySearchResultsPage
  include PageObject

  expected_title /.+ on Etsy, a global handmade and vintage marketplace\./
  expected_element :h1, :class => 'summary'
  h1 :search_results, :class => 'summary'
  paragraph :spelling, :class => 'spelling'
  link :first_result, :class => 'listing-thumb'

end