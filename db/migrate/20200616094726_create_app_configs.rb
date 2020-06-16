class CreateAppConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :app_configs do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
