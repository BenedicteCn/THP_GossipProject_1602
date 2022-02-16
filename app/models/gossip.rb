class Gossip < ApplicationRecord
  belongs_to :user
  has_many :affiliations, dependent: :destroy
  has_many :tags, through: :affiliations
  validates :title, presence: true
  validates :content, presence: true
end
