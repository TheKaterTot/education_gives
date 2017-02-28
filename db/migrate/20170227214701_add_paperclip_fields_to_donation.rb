class AddPaperclipFieldsToDonation < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :image_file_name,    :string
    add_column :donations, :image_content_type, :string
    add_column :donations, :image_file_size,    :integer
    add_column :donations, :image_updated_at,   :datetime
  end
end
