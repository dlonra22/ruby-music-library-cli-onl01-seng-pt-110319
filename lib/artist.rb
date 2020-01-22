require_relative 'concerns/findable.rb'
class Artist 
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def self.all
    @@all
  end
  
  def songs
   @songs
  end
  
  def genres
    songs.collect{|s| s.genre}.uniq
  end
  
  def add_song(song)
    song.artist = self if (song.artist == nil)
    @songs << song if !(@songs.include?(song))
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end