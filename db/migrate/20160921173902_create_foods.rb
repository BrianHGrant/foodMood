class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.integer :category_id
      t.integer :type_id
      t.integer :user_id
      t.datetime :time_consumed

      t.timestamps
    end
  end
end
