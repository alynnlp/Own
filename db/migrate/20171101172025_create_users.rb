class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :location
      t.integer :budget
      t.integer :size
      t.integer :age
      t.string :address
      t.string :occupation

      t.timestamps
    end
  end
end
