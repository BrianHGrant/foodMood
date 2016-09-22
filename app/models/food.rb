class Food < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :type

  def self.search(search)
    if search
      where("type_id LIKE :search", search: "#{search}")
    else
      where(nil)
    end
  end
end
