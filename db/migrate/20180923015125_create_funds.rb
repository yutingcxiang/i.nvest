class CreateFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :funds do |t|

      t.timestamps
    end
  end
end
