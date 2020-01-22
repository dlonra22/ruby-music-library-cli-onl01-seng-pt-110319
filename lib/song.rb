class Song 
  attr_accessor :name, :artist, :genre
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist.class==Artist
    self.genre=(genre) if genre.class==Genre
  end
  
  def self.all 
    @@all 
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
 def self.find_by_name(songname)
   self.all.detect {|s| s.name == songname}
 end
 def self.find_or_create_by_name(songname)
      self.find_by_name(songname) || self.create(songname)
 end
    
  def self.create(name, artist = nil, genre = nil)
    song = self.new(name)
    song.artist = artist if artist.class==Artist
    song.genre = genre if genre.class==Genre
    song.save
    song
  end
end