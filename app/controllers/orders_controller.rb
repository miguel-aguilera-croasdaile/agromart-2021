class OrdersController < ApplicationController

  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    listing = Listing.find(params[:listing_id])
    order  = Order.create!(listing: listing, amount: listing.price, status: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: listing.name,
        amount: (listing.price * 100).to_i,
        currency: listing.currency,
        quantity: 1
        }],
        success_url: order_url(order),
        cancel_url: order_url(order)
      )
      order.update(checkout_session_id: session.id)
      listing.update(available: False)
      redirect_to new_order_payment_path(order)
    end
  end
