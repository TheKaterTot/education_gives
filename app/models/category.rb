class Category < ApplicationRecord
  has_many :donations
  validates :name, presence: true, uniqueness: true
  def display_name
    name.split("-").map { |word| word.capitalize }.join(" ")
  end
end
#hound
