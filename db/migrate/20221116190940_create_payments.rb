class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :description
      t.references :user_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
