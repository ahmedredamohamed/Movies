class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :movie
      t.string :user
      t.integer :stars
      t.text :body

      t.timestamps
    end
  end
end
