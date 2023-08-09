require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { FactoryBot.create(:user) }
  before do
    user.skip_confirmation!
  end
  it 'logs in a User' do
    login_as user
    visit root_path
    expect(page).to have_content('Depenses')
  end
end
