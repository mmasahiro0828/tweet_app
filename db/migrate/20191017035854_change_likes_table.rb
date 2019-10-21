class ChangeLikesTable < ActiveRecord::Migration[5.2]
  def up
    add_reference :likes, :user, index: true
  end
  
  def down
    remove_reference :likes, :user, index: true
  end
end
