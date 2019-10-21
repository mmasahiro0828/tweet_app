class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :tweet_id
      t.timestamps
    end
  end
  
  def up
    add_reference :likes, :user, index: true
  end
end
