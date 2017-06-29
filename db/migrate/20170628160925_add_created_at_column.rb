class AddCreatedAtColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :questions, :created_at, :integer
    add_column :answers, :created_at, :integer
  end
end
