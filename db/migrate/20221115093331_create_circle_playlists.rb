class CreateCirclePlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :circle_playlists do |t|
      t.string :url
      t.references :circle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
