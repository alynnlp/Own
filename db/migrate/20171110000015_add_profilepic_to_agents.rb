class AddProfilepicToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :img, :string
  end
end
