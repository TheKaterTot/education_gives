class Category < ApplicationRecord
  has_many :donations

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map do |word|
      word.capitalize
    end.join(" ")
    Category.find_by(name: name)
  end
end
