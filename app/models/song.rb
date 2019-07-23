class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(content_array)
    content_array.reject(&:blank?).each do |nc|
      new_note = Note.create(content: nc, song: self) 
      self.notes << new_note
    end
    # new_note = Note.find_or_create_by(content: content)
    # self.notes << new_note
  end

  def note_contents
    self.notes.map {|n| n.content }
  end

  # def note_contents_1
  #   note_contents=(params[:song_notes_1])
  # end

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end

end
