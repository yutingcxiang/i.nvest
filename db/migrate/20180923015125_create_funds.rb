class CreateFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :funds do |t|
      t.string :symbol
      t.integer :quantity
      t.decimal :price
      t.string :type
      t.timestamps
    end
  end
end
