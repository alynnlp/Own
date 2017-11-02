class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.references :agent, index: true, foreign_key: true

      t.timestamps
    end
  end
end
