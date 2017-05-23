class CellPhonesController < ApplicationController

  def index
    @cell_phones = CellPhone.all
  end

  def new
    @cell_phone = CellPhone.new
  end

  def create
    @cell_phone = CellPhone.create(name: params["cell_phone"]["name"], manufacturer: params["cell_phone"]["manufacturer"])

    if @cell_phone.save
      flash[:alert] = "You have successfully created a phone!"
      redirect_to cell_phones_path
    else
      flash[:alert] = @cell_phone.errors.full_messages
      render :new
    end
  end

  def show
    @cell_phone = CellPhone.find(params[:id])
    @review = Review.new
    @reviews = Review.where(cell_phone_id: params[:id])
  end
end
