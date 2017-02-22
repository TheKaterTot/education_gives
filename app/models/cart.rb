class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_donation(donation_id)
    contents[donation_id.to_s] ||= 0
    contents[donation_id.to_s] += 1
  end

  def count_of(donation_id)
    contents[donation_id.to_s]
  end
end
