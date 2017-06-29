class AddPasswordConfirmationColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :encrypted_password_confirmation, :string
  end
end
