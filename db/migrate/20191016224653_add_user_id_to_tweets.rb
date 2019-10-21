class AddUserIdToTweets < ActiveRecord::Migration[5.2]
  def up
    execute "DELETE FROM tweets;"
    add_reference :tweets, :user, index: true
  end
  
  def down
    remove_reference :tweets, :user, index: true
  end
end
