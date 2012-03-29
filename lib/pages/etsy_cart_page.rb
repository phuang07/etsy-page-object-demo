class EtsyCartPage
  include PageObject
  
  expected_title 'Etsy - Shopping Cart'
  direct_url BASE_URL + 'cart'

  link :remove, :text => 'Remove'
  div :item_details, :class => 'item-details'
  link :first_item_name do |page|
    page.item_details_element.link_element
  end
  div :empty, :id => 'newempty'
  div :checkout_header, :id => 'checkout-header'

  def first_item_name_text
    first_item_name_element.text
  end

  def items_in_cart
    return 0 if empty_element.exists?
    checkout_header.gsub(' items in your cart', '').to_i
  end

  def remove_item
    remove
    empty_element.when_present
  end

  def ensure_cart_empty
    100.times do
      remove if items_in_cart != 0
      break if items_in_cart == 0
    end
  end
end
