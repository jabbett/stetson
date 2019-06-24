class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages, id: :uuid do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.references :parent, type: :uuid, foreign_key: { to_table: :pages }

      t.timestamps
    end
  end
end
