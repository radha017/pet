class Adopt < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  enum status: {pending: 0 , approved: 1 , rejected: 2}
end
