class RenameConfigurationToStetsonConfig < ActiveRecord::Migration[5.2]
  def change
    rename_table :configurations, :stetson_configs
  end
end
