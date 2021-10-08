class ShoppingCartPayedsController < ApplicationController
  before_action :authenticate_user!



   def paymant
     total_price=current_cart.total_price
     finish='no'
     user_cards=current_user.credit_cards
     available_cash=0

     if params[:payment_choice]=='ups'
       total_price+= 5
     end

     user_cards.each do |card|
     available_cash+=card.cash
     end

     if available_cash>total_price || available_cash==total_price
       user_cards.each do |card|
         if finish=='no' && card.cash>total_price || card.cash==total_price
           cash=card.cash-total_price
           card.update(cash: cash)
           finish='si'
         else
           next
         end
       end
       if finish=='si'
         @payed=ShoppingCartPayed.new(payment_choice: params[:payment_choice])
         @payed.shopping_cart_id= current_cart.id
         @payed.user_id= current_user.id
         @payed.cash= total_price
         current_cart.destroy
       end
     end

     respond_to do |format|
       if finish=='no'
         format.html { redirect_to catalog_products_url, notice: "You do not have enough cash for pay." }
         format.json { render :show, status: :created, location: root_path }
       elsif @payed.save
         format.html { redirect_to catalog_products_url, notice: "Cart has been payed successfully." }
         format.json { render :show, status: :created, location: root_path }
       else
         format.html { render :new, status: :unprocessable_entity }
         format.json { render json: @payed.errors, status: :unprocessable_entity }
       end
     end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart_payed
      @shopping_cart_payed = ShoppingCartPayed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_cart_payed_params
      params.fetch(:shopping_cart_payed, {})
    end
end
