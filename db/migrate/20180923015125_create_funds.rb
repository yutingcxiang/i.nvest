class CreateFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :funds do |t|
      t.string :symbol
      t.string :category
      t.string :industry
      t.string :description
      t.timestamps
    end
  end
end
