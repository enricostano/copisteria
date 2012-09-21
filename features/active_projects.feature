Feature: Active projects

  Just list down all the active projects

  @wip
  Scenario: create line_items and order from cart
    Given a cart
    When push generate order
    Then one order related to many line_item is created
