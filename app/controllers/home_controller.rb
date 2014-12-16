class HomeController < ApplicationController

  def index
    @order = Order.new
    @order.build_shipping_address
    @tagline = get_tagline
  end

  private

  def get_tagline
    [
      'Store of the Future',
      'All Your Friends Are Doing It',
      'Gifts, Made Thoughtless',
      "Mo' Money, Mo' Bitcrap",
      'Young Money, Hash Money',
      'Because, Why Not?'
    ].sample
  end
end
