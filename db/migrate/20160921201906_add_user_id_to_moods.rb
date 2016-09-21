class AddUserIdToMoods < ActiveRecord::Migration[5.0]
  def change
    add_column :moods, :user_id, :integer
  end
end
