class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|

      t.references :user, foreign_key: true, null: false
      t.string :phone_number, null: false
      t.datetime :desired_time, null: false
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
