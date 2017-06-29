class ChangePasswordConfirmationColumn < ActiveRecord::Migration[4.2]
  def change
    rename_column :users, :password_digest_confirmation, :password_confirmation
  end
end
