class AddSaltToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :salt, :string
  end
end
