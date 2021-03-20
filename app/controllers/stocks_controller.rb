class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy ]

  # GET /stocks or /stocks.json
  def index
    @stocks = Stock.all
  end

  # GET /stocks/1 or /stocks/1.json
  def show
    @stock_orders = SellOrder.where(stock_id: params[:id])
  end

  # GET /stocks/new
  def new
    @stock = Stock.new # included for new records of future stocks to be added onto the platform
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:id, :name, :symbol)
    end
end
