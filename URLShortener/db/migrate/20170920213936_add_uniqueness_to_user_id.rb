class AddUniquenessToUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :shortened_urls, :user_id
    add_column :shortened_urls, :user_id, :integer, null: false
  end
end
