class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :location
      t.text :content
      t.boolean :publish

      t.timestamps
    end
  end
end
