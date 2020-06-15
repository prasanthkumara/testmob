class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.text :code
      t.integer :user_id
      t.text :spec
      t.text :output

      t.timestamps
    end
  end
end
