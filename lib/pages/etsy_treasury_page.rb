class EtsyTreasuryPage
  include PageObject

  expected_title "Etsy - Treasury"
  div :list_treasury, :class => "list-treasury"
  list_item :treasury, :class => "item-treasury"
  div(:item_hotness) { |page| page.treasury_element.div_element(:class => "item-treasury-hotness") }
  div(:item_info) { |page| page.treasury_element.div_element(:class => "item-treasury-info") }
  div(:item_stats) { |page| page.treasury_element.div_element(:class => "item-treasury-stats") }
  div(:item_preview) { |page| page.treasury_element.div_element(:class => "item-treasury-preview") }

end