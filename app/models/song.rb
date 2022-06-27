class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
    self.save
  end
  
  def artist_name
    !self.artist.nil? ? self.artist.name : ""
  end

  def note_contents
    notes.map(&:content)
  end

  def note_contents=(arr)
    arr.each do |str|
      notes << Note.create(content: str)
    end
  end
end
