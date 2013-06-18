class AddAdminFieldToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :is_admin, :boolean, :default => false
  end
end
