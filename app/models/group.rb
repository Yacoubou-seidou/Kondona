class Group < ApplicationRecord
  belongs_to :user
  has_many :group_depenses
  has_many :depenses, through: :group_depenses # Change this line
  validates :name, presence: true
  validates :icon, presence: true
end
