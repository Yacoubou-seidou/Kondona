class Depense < ApplicationRecord
  belongs_to :user
  has_many :group_depenses
  has_many :groups, through: :group_depenses

  validates :name, presence: true
  validates :amount, presence: true
end
