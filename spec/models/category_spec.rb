require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations for category model' do
    before(:each) do
      @user = User.create(name: 'sam', email: 'mu@gmail.com', password: 'secret', password_confirmation: 'secret')
      @category = Category.create(name: 'pizza', user_id: @user.id, icon: 'kilogram')
    end

    it 'check if name is present' do
      @category.name = nil
      expect(@category).to_not be_valid
    end
    it 'check if icon is present' do
      expect(@category).to be_valid
    end
  end
end
