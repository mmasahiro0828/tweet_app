class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :description, limit: 140, null: false

      t.timestamps
    end
  end
end
