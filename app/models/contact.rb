class Contact < ApplicationRecord
  validates :name, :email, presence: true
  has_many :phones, dependent: :destroy
end
