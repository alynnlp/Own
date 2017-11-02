class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :email
      t.string :password
      t.text :bio
      t.text :specialty
      t.string :location
      t.timestamps
    end
  end
end
