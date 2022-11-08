class CreateEventMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :event_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
