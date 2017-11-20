class RemovePasswordDigestionFromAgents < ActiveRecord::Migration[5.1]
  def change
    remove_column :agents, :password_digestion, :string
  end
end
