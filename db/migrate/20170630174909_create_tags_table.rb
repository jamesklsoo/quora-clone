class CreateTagsTable < ActiveRecord::Migration[4.2]
  def change
    create_table :tags do |t|
      t.string :content
      t.timestamps
    end
  end
end
