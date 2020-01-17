class CreateItems < ActiveRecord::Migration[5.2]
  def change
    # items is the table name
    create_table :items do |t|
      t.string :name
      t.boolean :done
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
