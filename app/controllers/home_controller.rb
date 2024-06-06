class HomeController < ApplicationController
  def index
    @quote = Quote.last
  end
end
