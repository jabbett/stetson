class ChangeVersionsItemIdToUuid < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :uuid, :uuid, null: false
    change_table :versions do |t|
      t.remove :item_id
      t.rename :uuid, :item_id
    end
    add_index :versions, %i(item_type item_id)
  end
end
