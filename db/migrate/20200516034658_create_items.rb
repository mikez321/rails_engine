class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :unit_price
      t.bigint :merchant_id

      t.timestamps
    end
  end
end
