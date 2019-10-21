class DeleteAllOfLikes < ActiveRecord::Migration[5.2]
  def update
    execute 'DELETE FROM likes;'
  end
end
