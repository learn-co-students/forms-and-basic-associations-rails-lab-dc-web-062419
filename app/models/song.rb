class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
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

  def note_contents
    self.notes.map do |e|
      e.content
    end
  end

  def note_contents=(array_of_note_text_from_form)
    array_of_note_text_from_form.each do |e|
      if !e.empty?
      self.notes << Note.find_or_create_by(content: e)
      end
    end
  end

end
