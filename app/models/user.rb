class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :city, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :email, presence: true

end
