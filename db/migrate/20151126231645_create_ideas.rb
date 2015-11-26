class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.integer :gift_id
      t.datetime :created_at
      t.references :user, index: true, foreign_key: true
      t.references :gift, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
