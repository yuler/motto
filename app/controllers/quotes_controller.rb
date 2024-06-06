class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    quote = Quote.find(params[:id])
    quote.update(quote_params)
    redirect_to quotes_path
  end

  def create
    Quote.create(quote_params)
    redirect_to root_path
  end

  def destroy
    Quote.find(params[:id]).destroy
    redirect_to quotes_path
  end

  private

  def quote_params
    params.require(:quote).permit(:content, :author, :poster)
  end
end
