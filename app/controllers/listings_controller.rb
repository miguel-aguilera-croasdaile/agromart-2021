class ListingsController < ApplicationController

  def new
    @listing = Listing.new
    @product = Product.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.save

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, notice: :error }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def listing_params
    params.require(:listing).permit(
      :product,
      :name,
      :category,
      :quantity_unit,
      :quantity,
      :price,
      :currency,
      :address
    )
  end

end
