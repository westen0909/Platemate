class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :rating
      t.string :price
      t.string :location
      t.string :review

      t.timestamps
    end
  end
end
