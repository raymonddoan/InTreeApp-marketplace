class SentimentsController < ApplicationController
  before_action :set_sentiment, only: %i[ show edit update destroy ]

  # GET /sentiments or /sentiments.json
  def index
    @sentiments = Sentiment.all
  end

  # GET /sentiments/1 or /sentiments/1.json
  def show
  end

  # GET /sentiments/new
  def new
    @sentiment = Sentiment.new
  end

  # GET /sentiments/1/edit
  def edit
  end

  # POST /sentiments or /sentiments.json
  def create
    @sentiment = Sentiment.new(sentiment_params)

    respond_to do |format|
      if @sentiment.save
        format.html { redirect_to @sentiment, notice: "Sentiment was successfully created." }
        format.json { render :show, status: :created, location: @sentiment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sentiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sentiments/1 or /sentiments/1.json
  def update
    respond_to do |format|
      if @sentiment.update(sentiment_params)
        format.html { redirect_to @sentiment, notice: "Sentiment was successfully updated." }
        format.json { render :show, status: :ok, location: @sentiment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sentiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sentiments/1 or /sentiments/1.json
  def destroy
    @sentiment.destroy
    respond_to do |format|
      format.html { redirect_to sentiments_url, notice: "Sentiment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentiment
      @sentiment = Sentiment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sentiment_params
      params.require(:sentiment).permit(:is_bearish, :comment, :user_id, :stock_id)
    end
end
