class CellPhonesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cell_phones = CellPhone.all
    if params[:search]
      @cell_phones = CellPhone.search(params[:search]).order("created_at DESC")
    else
      @cell_phones = CellPhone.all.order("created_at DESC")
    end
  end

  def new
    @cell_phone = CellPhone.new
  end

  def create
    @cell_phone = CellPhone.create(name: params["cell_phone"]["name"], manufacturer: params["cell_phone"]["manufacturer"], user_id: current_user.id)
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

  def edit
    @cell_phone = CellPhone.find(params[:id])
  end

  def update
    @cell_phone = CellPhone.find(params[:id])
    if @cell_phone.update_attributes(cell_phone_params) && current_user == @cell_phone.user
      flash[:notice] = "CellPhone Successfully Updated"
      redirect_to cell_phones_path
    else
      render 'edit'
    end
  end

  def destroy
    @cell_phone = CellPhone.find(params[:id])
    @cell_phone.destroy
    flash[:alert] = "Cell Phone has been deleted"
    redirect_to cell_phones_path
  end

  def upvote
    @cell_phone = CellPhone.find(params[:id])
    Vote.create(cell_phone: @cell_phone, user: current_user)
    redirect_to(cell_phones_path)
  end

  private

  def cell_phone_params
    params.require(:cell_phone).permit(:body, :user_id, :name, :manufacturer)
  end
end
