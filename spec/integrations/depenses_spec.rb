require 'rails_helper'

RSpec.describe 'Depenses', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:group) { FactoryBot.create(:group, user:) }

  before do
    user.skip_confirmation!
    login_as user
  end

  it 'creates a Depense' do
    depense_name = 'Depense Name'
    depense_amount = 50.00
    FactoryBot.create(:depense, name: depense_name, amount: depense_amount, user:, groups: [group])
    visit group_path(group)
    expect(page).to have_content(depense_name)
  end
end
