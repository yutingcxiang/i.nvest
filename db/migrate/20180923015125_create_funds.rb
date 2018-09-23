class CreateFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :funds do |t|
      t.integer :quantity
      t.string :type
      t.string :industry
      t.decimal :cost
      t.integer :user_id
      t.integer :portfolio_id
      t.timestamps
    end
  end
end
