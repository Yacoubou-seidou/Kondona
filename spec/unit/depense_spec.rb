require 'rails_helper'

RSpec.describe Depense, type: :model do
  it 'is valid with valid attributes' do
    depense = build(:depense)
    expect(depense).to be_valid
  end

  it 'is not valid without a name' do
    depense = build(:depense, name: nil)
    expect(depense).not_to be_valid
  end
  it 'is not valid without amount' do
    depense = build(:depense, amount: nil)
    expect(depense).not_to be_valid
  end
end
