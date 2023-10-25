  class Animal < ApplicationRecord
    belongs_to :user
    has_many :adopts
    has_one_attached :image
  end
