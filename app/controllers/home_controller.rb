class HomeController < ApplicationController

  def index
    @order = Order.new
    @amount_remaining = display_amount
    @order.build_shipping_address
    @tagline = get_tagline
  end

  def wtf
  end

  def privacy
  end

  def tos
  end

  private

  def display_amount
    amount_remaining = Order.amount_remaining
    if amount_remaining > 0
      amount_remaining
    else
      "<span class='warning'>SOLD OUT</span>".html_safe
    end
  end

  def get_tagline
    [
      'Store of the Future',
      'All Your Friends Are Doing It',
      'Gifts, Made Thoughtless',
      "Mo' Money, Mo' Bitcrap",
      'Young Money, Hash Money',
      'Because, Why Not?',
      "Don't Think, Just Buy"
    ].sample
  end
end
