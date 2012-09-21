Given /^a cart$/ do
  @cart = { 1 => 1 }
end

When /^push generate order$/ do
  @order = Order.create
end

Then /^one order related to many line_item is created$/ do
  @order.line_items.should
end
