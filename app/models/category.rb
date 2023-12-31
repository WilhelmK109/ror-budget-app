class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :expenses

  validates :name, :icon, presence: true

  def total_amount
    expenses.sum(:amount)
  end
end
