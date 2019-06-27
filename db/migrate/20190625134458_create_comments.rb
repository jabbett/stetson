class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :page, type: :uuid, foreign_key: { to_table: :pages }
      t.references :creator, type: :uuid, foreign_key: { to_table: :users }
      t.string :body
      t.datetime :resolved_at
      t.references :resolved_by, type: :uuid, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
