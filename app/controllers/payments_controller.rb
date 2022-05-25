class PaymentsController < ApplicationController
  def index; end

  def show
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      redirect_to category_path(params[:category_id]), notice: "payment #{@payment.name} was successfully created!"
    else
      redirect_to new_category_payment_path, notice: 'payment could not be created!'
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :author_id, :category_id, :amount)
  end
end
