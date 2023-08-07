class Group < ApplicationRecord
  belongs_to :user
  has_many :group_depenses
  has_many :entities, through: :group_depenses

  validates :name, presence: true
  validates :icon, presence: true
end
