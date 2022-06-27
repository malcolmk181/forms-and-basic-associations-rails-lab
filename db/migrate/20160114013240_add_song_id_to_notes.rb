class AddSongIdToNotes < ActiveRecord::Migration[4.2]
  def change
    add_column :notes, :song_id, :integer
  end
end
