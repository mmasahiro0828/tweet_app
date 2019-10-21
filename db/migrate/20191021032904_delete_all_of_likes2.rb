class DeleteAllOfLikes2 < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM likes;'
  end
end
