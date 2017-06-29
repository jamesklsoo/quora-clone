class RemoveColumnCreatedAt < ActiveRecord::Migration[4.2]
  def change
    remove_column :questions, :created_at
    remove_column :answers, :created_at

    add_column :questions, :created_at, :datetime
    add_column :questions, :updated_at, :datetime

    add_column :answers, :created_at, :datetime
    add_column :answers, :updated_at, :datetime
  end
end
