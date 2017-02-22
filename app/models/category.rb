class Category < ApplicationRecord
  has_many :donations

  def display_name
    self.name.split("-").map { |word| word.capitalize }.join(" ")
  end
end
