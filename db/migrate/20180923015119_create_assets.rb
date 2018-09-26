class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :user_id
      t.integer :fund_id
      t.timestamps
    end
  end
end
