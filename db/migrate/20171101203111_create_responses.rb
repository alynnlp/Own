class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.boolean :accept
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :agent, index: true, foreign_key: true

      t.timestamps
    end
  end
end
