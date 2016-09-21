class Food < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :type
end
