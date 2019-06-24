class CreateConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :configurations, id: :uuid do |t|
      t.string :site_name
      t.references :home_page, type: :uuid, foreign_key: { to_table: :pages }

      t.timestamps
    end
  end
end
