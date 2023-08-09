require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    group = build(:group)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = build(:group, name: nil)
    expect(group).not_to be_valid
  end
  it 'is not valid without icon' do
    group = build(:group, icon: nil)
    expect(group).not_to be_valid
  end
end
