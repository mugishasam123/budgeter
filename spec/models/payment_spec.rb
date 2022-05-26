require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations for payment model' do
    before(:each) do
      @user = User.create(name: 'sam', email: 'mu@gmail.com', password: 'secret', password_confirmation: 'secret')
      @category = Category.create(name: 'pizza', user_id: @user.id, icon: 'kilogram')
      @payment = Payment.create(name: 'pizza', author_id: @user.id, category_id: @category.id, amount: 45)
    end

    it 'check if name is present' do
      @payment.name = nil
      expect(@payment).to_not be_valid
    end
    it 'check if amount is present' do
      expect(@payment).to be_valid
    end
  end
end
