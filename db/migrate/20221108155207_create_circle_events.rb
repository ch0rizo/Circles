class CreateCircleEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :circle_events do |t|
      t.references :circle, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
