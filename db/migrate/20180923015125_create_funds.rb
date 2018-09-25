class CreateFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :funds do |t|
      t.string :symbol
      t.string :type
      t.integer :user_id
      t.integer :portfolio_id
      t.timestamps
    end
  end
end
