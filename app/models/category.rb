class Category < ApplicationRecord
  has_many :foods

  def self.search(search)
    if search
      where("name LIKE :search", search: "#{search}")
    else
      where(nil)
    end
  end
end
