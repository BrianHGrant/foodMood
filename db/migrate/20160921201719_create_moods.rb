class CreateMoods < ActiveRecord::Migration[5.0]
  def change
    create_table :moods do |t|
      t.integer :level
      t.datetime :time

      t.timestamps
    end
  end
end
