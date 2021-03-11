class SellOrdersController < ApplicationController
  before_action :set_sell_order, only: %i[ show edit update destroy ]

  # GET /sell_orders or /sell_orders.json
  def index
    @sell_orders = SellOrder.all
  end

  # Show only own orders
  def own
    @own_orders = SellOrder.where(seller_id: current_user.id)
  end
  
  # GET /sell_orders/1 or /sell_orders/1.json
  def show
  end

  # GET /sell_orders/new
  def new
    @sell_order = SellOrder.new
  end

  # GET /sell_orders/1/edit
  def edit
  end

  # POST /sell_orders or /sell_orders.json
  def create
    @sell_order = SellOrder.new(sell_order_params)

    respond_to do |format|
      if @sell_order.save
        format.html { redirect_to @sell_order, notice: "Sell order was successfully created." }
        format.json { render :show, status: :created, location: @sell_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sell_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sell_orders/1 or /sell_orders/1.json
  def update
    respond_to do |format|
      if @sell_order.update(sell_order_params)
        format.html { redirect_to @sell_order, notice: "Sell order was successfully updated." }
        format.json { render :show, status: :ok, location: @sell_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sell_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sell_orders/1 or /sell_orders/1.json
  def destroy
    @sell_order.destroy
    respond_to do |format|
      format.html { redirect_to sell_orders_url, notice: "Sell order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_order
      @sell_order = SellOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sell_order_params
      params.require(:sell_order).permit(:quantity, :price, :expiry_date, :stock_id, :seller_id, :buyer_id)
    end
end
