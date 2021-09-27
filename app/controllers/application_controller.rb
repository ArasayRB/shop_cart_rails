class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
    parsed_locale.to_sym:
    nil
  end

  def current_cart
      ShoppingCart.find(session[:shopping_cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = ShoppingCart.create
      session[:shopping_cart_id] = cart.id
      cart
  end
    #def current_cart
    #    Cart.find(session[:cart_id])
    #  rescue ActiveRecord::RecordNotFound
    #    cart = Cart.create
    #    session[:cart_id] = cart.id
    #    cart
    #  end

end
