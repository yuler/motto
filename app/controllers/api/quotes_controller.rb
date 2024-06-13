module Api
  class QuotesController < Api::BaseController
    allow_unauthenticated_access only: :show

    api :GET, "/quotes/today", "Get today's quote"
    description "Get today's quote"
    returns code: 200, desc: "A successful response" do
    end
    def show
      @quote = Quote.today
    end
  end
end
