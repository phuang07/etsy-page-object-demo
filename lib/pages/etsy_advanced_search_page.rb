class EtsyAdvancedSearchPage 
  include PageObject

  expected_title "Etsy :: Advanced Search"
  direct_url BASE_URL + "search_advanced.php"

  text_field :search_box, :id => "search_query"
  div :search_category, :class => "search-category"
  div :advanced_search, :id => "advanced-search"
  select_list(:sub_category) { |page| page.search_category_element.when_present.select_list_element }
  button(:search) { |page| page.advanced_search_element.button_element }

  def search_for search_term
    self.search_box = search_term
    search
  end

end