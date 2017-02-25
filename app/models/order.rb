class Order < ApplicationRecord
  belongs_to :user
  has_many :details, class_name: "OrderDonation"
  has_many :donations, through: :details

  def display_create_date
    created_at.strftime("%m-%d-%Y")
  end

  def display_update_date
    updated_at.strftime("%m-%d-%Y")
  end

  def total
    details.sum(:subtotal)
  end

  def display_status
    status.capitalize
  end

  def next_status
    if status == "ordered"
      ["paid", "cancelled"]
    elsif status == "paid"
      ["completed", "cancelled"]
    else
      []
    end
  end

  def self.count_by_status(status)
    where(status: status).count
  end

  def self.count_for_all_statuses
    statuses = ["ordered", "paid", "cancelled", "completed"]
    statuses.reduce({}) do |counts, status|
      counts.merge!({status => Order.count_by_status(status)})
    end.merge!({"all" => Order.count})
  end
end
