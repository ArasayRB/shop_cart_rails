class ItemLinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_line, only: %i[ show edit update destroy ]

  # GET /item_lines or /item_lines.json
  def index
    @item_lines = ItemLine.all
  end

  # GET /item_lines/1 or /item_lines/1.json
  def show
  end

  # GET /item_lines/new
  def new
    @item_line = ItemLine.new
  end

  # GET /item_lines/1/edit
  def edit
  end

  # POST /item_lines or /item_lines.json
  def create
    @shopping_cart=current_cart
    product = Product.find(params[:product_id])
    @item_line = @shopping_cart.add_product(product.id) #.new(item_line_params)
    stock = product.stock - 1
    product.update(stock: stock)

    respond_to do |format|
      if @item_line.save
        format.html { redirect_to @item_line.shopping_cart, notice: "Item line was successfully created." }
        format.json { render :show, status: :created, location: @item_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_lines/1 or /item_lines/1.json
  def update
    respond_to do |format|
      if @item_line.update(item_line_params)
        format.html { redirect_to @item_line, notice: "Item line was successfully updated." }
        format.json { render :show, status: :ok, location: @item_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_lines/1 or /item_lines/1.json
  def destroy
    @item_line.destroy
    respond_to do |format|
      format.html { redirect_to item_lines_url, notice: "Item line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_line
      @item_line = ItemLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_line_params
      params.require(:item_line).permit(:product_id, :shopping_cart_id)
    end
end
