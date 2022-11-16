class AddBalanceToUserEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :user_events, :balance, :integer, default: 0
  end
end
