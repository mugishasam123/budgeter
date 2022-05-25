require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    before(:each) do
      visit new_user_session_path
      @user = User.create(name: 'sam', email: 'mu@gmail.com', password: 'secret', password_confirmation: 'secret')
      @category = Category.create(name: 'pizza', user_id: @user.id, icon: 'kilogram')
      within 'form' do
        fill_in 'Email', with: @user.email
        fill_in 'password', with: @user.password
      end
      button_click('Log in')
    end
  end

  it 'returns http success' do
    get '/categories/index'
    expect(response).to have_http_status(302)
  end
end
