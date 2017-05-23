class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @cell_phone = CellPhone.find(params[:cell_phone_id])
    @review = Review.new
  end

  def create
    # binding.pry
    @review = Review.create(cell_phone_id: params["review"]["cell_phone_id"], name: params["review"]["name"])

    if @review.save
      flash[:alert] = "Thank you for posting a review!"
    else
      flash[:alert] = @review.errors.full_messages
    end
    redirect_to cell_phone_path(params["review"]["cell_phone_id"])
  end
end
