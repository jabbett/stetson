class AddCreatorUpdaterToPages < ActiveRecord::Migration[5.2]
  def change
    add_reference :pages, :creator, type: :uuid, foreign_key: { to_table: :users }
    add_reference :pages, :updater, type: :uuid, foreign_key: { to_table: :users }
  end
end
