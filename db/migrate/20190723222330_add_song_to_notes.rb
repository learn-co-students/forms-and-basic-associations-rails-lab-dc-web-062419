class AddSongToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :song, foreign_key: true
  end
end
