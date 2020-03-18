class AddImageAdminToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :image, :string
    add_column :users, :admin, :boolean, default: false
  end

  def down
    remove_column :users, :image
    remove_column :users, :admin
  end
end
