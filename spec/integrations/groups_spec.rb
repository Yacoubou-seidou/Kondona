require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:group) { FactoryBot.create(:group, user:) }

  before do
    user.skip_confirmation!
    login_as user
  end

  it 'creates a group' do
    visit group_path(group)

    expect(page).to have_content(group.name)
  end
end
