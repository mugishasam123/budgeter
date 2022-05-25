class Category < ApplicationRecord
  has_many :payments
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
