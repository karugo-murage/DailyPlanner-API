class Donation < ApplicationRecord
  belongs_to :user
  validates :amount, numericality: { greater_than: 0 }
  validates :payment_method, presence: true
end
