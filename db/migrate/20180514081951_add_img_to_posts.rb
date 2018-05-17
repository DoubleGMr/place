class AddImgToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :banner, :string
  	add_column :posts, :video, :string
  end
end
