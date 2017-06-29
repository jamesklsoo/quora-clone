class ChangePasswordColumnName < ActiveRecord::Migration[4.2]
  def change
    rename_column :users, :encrypted_password, :password_digest
    rename_column :users, :encrypted_password_confirmation, :password_digest_confirmation
  end
end
