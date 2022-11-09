class AddDescriptionToCircles < ActiveRecord::Migration[7.0]
  def change
    add_column :circles, :description, :text
  end
end
