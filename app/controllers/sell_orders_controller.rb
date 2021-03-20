class SellOrdersController < ApplicationController
  before_action :set_sell_order, only: %i[ show edit update destroy authorise_user]
  before_action :authorise_user, only: %i[ edit destroy ]

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
    if user_signed_in?
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
          name: @sell_order.stock.name,
          description: @sell_order.stock.symbol,
          amount: (@sell_order.price * 100).to_i, # Stripe takes money by cents
          currency: 'aud',
          quantity: @sell_order.quantity
        }],
        payment_intent_data: {
          metadata: {
            user_id: current_user.id,
            listing_id: @sell_order.id
          }
        },
        success_url: "#{root_url}payments/success?SellOrderId=#{@sell_order.id}",
        # Check to revert back to the order page
        cancel_url: "#{root_url}sell_orders/#{@sell_order.id}"
      )
    
      @session_id = session.id
    end
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
    @sell_order.seller_id = current_user.id
    @sell_order.report.attach(params[:sell_order][:report])
    if @sell_order.buyer_id != nil
      @sell_order.filled = true
    end

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
    @sell_order.seller_id = current_user.id
    if params[:sell_order][:report]
      @sell_order.report.attach(params[:sell_order][:report])
    end
    
    if @sell_order.buyer_id != nil
      @sell_order.filled = true
    end
    
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

    # Allows authorised 
    def authorise_user
      respond_to do |format|
        if current_user.id != @sell_order.seller_id
          format.html { redirect_to root_path, alert: "You are not authorised to perform this action" }
        else
          break
        end
      end
    end
end
