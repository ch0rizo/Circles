class AddBorderColorToCircles < ActiveRecord::Migration[7.0]
  def change
    add_column :circles, :border_color, :string, default: "#FFFFFF"
  end
end
