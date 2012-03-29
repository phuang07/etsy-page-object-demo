class EtsyItemPage
  include PageObject

  button :add_to_cart, :value => "Add to Cart"
  div :item_title, :id => "item-title"

end