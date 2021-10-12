class ListingsController < ApplicationController

  def new
    @listing = Listing.new
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
    @listings = Listing.where(available: true)
    @listings = @listings.search_by_name(params[:name]) if params[:name].present? and params[:name] != ""
    if params[:sort_by].present?
      @listings = @listings.sort { |a, b|  b.created_at <=> a.created_at } if params[:sort_by] == "most_recent"
      @listings = @listings.sort { |a, b|  b.price <=> a.price } if params[:sort_by] == "highest_price"
      @listings = @listings.sort { |a, b|  a.price <=> b.price } if params[:sort_by] == "lowest_price"
      @listings = @listings.sort { |a, b|  b.quantity <=> a.quantity } if params[:sort_by] == "most"
      @listings = @listings.sort { |a, b|  a.quantity <=> b.quantity } if params[:sort_by] == "least"
    end

    @products = @query
    if params[:name] == ""
      redirect_to listings_path
    end
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
